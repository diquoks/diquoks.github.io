import "package:diquoks_web/diquoks_web.dart";
import "package:jaspr/dom.dart";
import "package:jaspr/jaspr.dart";
import "package:jaspr_router/jaspr_router.dart";

class NotFoundPage extends StatelessComponent {
  const NotFoundPage({super.key, required this._state});

  final RouteState _state;

  @override
  Component build(BuildContext context) {
    return main_(classes: "not-found-page", <Component>[
      if (_state.error != null)
        CustomError(
          image: const Image(src: "assets/images/omegalul-i-guess.webp"),
          title: "Возникла ошибка!",
          description: _state.error.toString(),
        )
      else
        const CustomError(
          image: Image(src: "assets/images/peepo-detective.webp"),
          title: "Страница не найдена!",
          description: "Возможно она найдётся, если искать повнимательней...",
        ),
    ]);
  }

  @css
  static List<StyleRule> get styles => <StyleRule>[
    css(".not-found-page").styles(justifyContent: .center),
  ];
}
