import "package:diquoks_web/diquoks_web.dart";
import "package:jaspr/dom.dart";
import "package:jaspr/jaspr.dart";
import "package:jaspr_router/jaspr_router.dart";

class Application extends StatelessComponent {
  const Application({super.key});

  @override
  Component build(BuildContext context) {
    return body(<Component>[
      const CustomHeader(),
      Router(
        routes: <RouteBase>[
          Route(path: "/", builder: (_, _) => const HomePage()),
          Route(path: "/osu-stuff", builder: (_, _) => const OsuStuffPage()),
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
