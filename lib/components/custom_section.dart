import "package:diquoks_web/diquoks_web.dart";
import "package:jaspr/dom.dart";
import "package:jaspr/jaspr.dart";

class CustomSection<T> extends StatelessComponent {
  const CustomSection({
    super.key,
    required this._content,
    required this._direction,
    required this._builder,
  });

  final SectionContent<T> _content;
  final FlexDirection _direction;
  final Component Function(T) _builder;

  @override
  Component build(BuildContext context) {
    return section(classes: "custom-section limited-width", <Component>[
      h1(<Component>[.text(_content.title)]),
      div(
        styles: Styles(flexDirection: _direction),
        _content.items.map(_builder).toList(),
      ),
    ]);
  }

  @css
  static List<StyleRule> get styles => <StyleRule>[
    css(".custom-section", <StyleRule>[
      css("&").styles(display: .flex, flexDirection: .column, gap: .all(24.px)),
      css("& > h1").styles(
        color: Colors.white,
        textAlign: .left,
        fontFamily: CustomFonts.getFontFamilies(openSans: true),
        fontSize: 24.px,
        fontWeight: .w700,
      ),
      css("& > div").styles(
        display: .flex,
        flexWrap: .wrap,
        justifyContent: .center,
        alignItems: .center,
        gap: .all(32.px),
      ),
    ]),
  ];
}
