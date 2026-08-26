import "dart:io";

import "package:diquoks_web/diquoks_web.dart";
import "package:diquoks_web/main.server.options.dart";
import "package:jaspr/dom.dart";
import "package:jaspr/server.dart";
import "package:pubspec_parse/pubspec_parse.dart";

void main() {
  Jaspr.initializeApp(options: defaultServerOptions);

  final Pubspec pubspec = Pubspec.parse(
    File("pubspec.yaml").readAsStringSync(),
  );

  runApp(
    Document(
      title: CustomData.title,
      lang: "ru",
      charset: "UTF-8",
      viewport: "width=device-width, initial-scale=1.0",
      meta: <String, String>{
        "title": CustomData.title,
        "description": pubspec.description!,
        "author": "Denis Titovets",
        "keywords":
            "${CustomData.title}, ${pubspec.name}, diquoks, github, pages",
        "robots": "nosnippet",
        "mobile-web-app-capable": "yes",
        "apple-mobile-web-app-status-bar-style": "black-translucent",
        "apple-mobile-web-app-title": CustomData.title,
      },
      head: <Component>[
        link(rel: "canonical", href: pubspec.homepage!),
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
      body: Application(version: pubspec.version!),
    ),
  );
}
