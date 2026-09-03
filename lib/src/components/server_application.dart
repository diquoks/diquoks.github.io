import "package:diquoks_web/diquoks_web.dart";
import "package:jaspr/dom.dart";
import "package:jaspr/server.dart";
import "package:jaspr_router/jaspr_router.dart";
import "package:pubspec_parse/pubspec_parse.dart";

class ServerApplication extends StatelessComponent {
  const ServerApplication({super.key, required this._pubspec});

  final Pubspec _pubspec;

  @override
  Component build(BuildContext context) {
    return Document(
      title: CustomData.title,
      lang: "ru",
      meta: <String, String>{
        "title": CustomData.title,
        "description": _pubspec.description!,
        "author": CustomData.author,
        "keywords": <String>[_pubspec.name, CustomData.title].join(", "),
        "mobile-web-app-capable": "yes",
        "apple-mobile-web-app-status-bar-style": "black-translucent",
        "apple-mobile-web-app-title": CustomData.title,
        "google-site-verification": CustomData.googleVerification,
        "yandex-verification": CustomData.yandexVerification,
      },
      head: <Component>[
        link(rel: "canonical", href: _pubspec.homepage!),
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
      body: body(<Component>[
        CustomHeader(version: _pubspec.version!),
        Router(
          routes: <RouteBase>[
            Route(path: "/", builder: (_, _) => const HomePage()),
            Route(
              path: "/404.html",
              builder: (_, RouteState state) => NotFoundPage(state: state),
            ),
          ],
          errorBuilder: (_, RouteState state) => NotFoundPage(state: state),
        ),
        const CustomFooter(),
      ]),
    );
  }

  @css
  static List<StyleRule> get styles => <StyleRule>[
    css("*").styles(padding: .zero, margin: .zero, border: .none),
    css("body").styles(
      display: .flex,
      minHeight: 100.vh,
      flexDirection: .column,
      backgroundColor: Colors.black,
    ),
    css("main").styles(
      display: .flex,
      padding: .all(32.px),
      flexDirection: .column,
      alignItems: .center,
      gap: .all(32.px),
      flex: const .grow(1),
      backgroundColor: CustomColors.background,
    ),
    css(".limited-width").styles(width: 100.percent, maxWidth: 1280.px),
  ];
}
