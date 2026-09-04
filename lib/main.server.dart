import "dart:io";

import "package:diquoks_web/diquoks_web.dart";
import "package:diquoks_web/main.server.options.dart";
import "package:jaspr/dom.dart";
import "package:jaspr/server.dart";
import "package:jaspr_riverpod/jaspr_riverpod.dart";
import "package:jaspr_riverpod/misc.dart";
import "package:pubspec_parse/pubspec_parse.dart";

void main() {
  Jaspr.initializeApp(options: defaultServerOptions);

  runApp(
    ProviderScope(
      overrides: <Override>[
        websiteContentProvider.overrideWithValue(
          WebsiteContent(
            pubspec: Pubspec.parse(File("pubspec.yaml").readAsStringSync()),
          ),
        ),
      ],
      child: Builder(
        builder: (BuildContext context) {
          final WebsiteContent content = context.read(websiteContentProvider);

          return Document(
            title: content.title,
            lang: "ru",
            meta: <String, String>{
              "title": content.title,
              "description": content.description,
              "author": content.author,
              "keywords": <String>[content.name, content.title].join(", "),
              "mobile-web-app-capable": "yes",
              "apple-mobile-web-app-status-bar-style": "black-translucent",
              "apple-mobile-web-app-title": content.title,
              "google-site-verification": content.googleVerification,
              "yandex-verification": content.yandexVerification,
            },
            head: <Component>[
              link(rel: "canonical", href: content.homepage),
              const link(rel: "manifest", href: "manifest.json"),
              const link(
                rel: "icon",
                href: "assets/favicons/favicon.ico",
                attributes: <String, String>{"sizes": "any"},
              ),
              const link(
                rel: "icon",
                href: "assets/favicons/logo.svg",
                attributes: <String, String>{"type": "image/svg+xml"},
              ),
              const link(
                rel: "apple-touch-icon",
                href: "assets/favicons/apple-touch-icon.png",
                attributes: <String, String>{"sizes": "180x180"},
              ),
            ],
            body: const Application(),
          );
        },
      ),
    ),
  );
}
