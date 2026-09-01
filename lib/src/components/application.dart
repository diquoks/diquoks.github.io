import "package:diquoks_web/diquoks_web.dart";
import "package:jaspr/dom.dart";
import "package:jaspr/jaspr.dart";
import "package:jaspr_router/jaspr_router.dart";
import "package:pub_semver/pub_semver.dart";

class Application extends StatelessComponent {
  const new({super.key, required this._version});

  final Version _version;

  @override
  Component build(BuildContext context) {
    return body(<Component>[
      CustomHeader(version: _version),
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
    ]);
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
