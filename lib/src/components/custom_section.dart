import "package:diquoks_web/diquoks_web.dart";
import "package:jaspr/dom.dart";
import "package:jaspr/jaspr.dart";

class CustomSection extends StatelessComponent {
  const CustomSection({
    super.key,
    required this._title,
    required this._children,
  });

  final String _title;
  final List<Component> _children;

  @override
  Component build(BuildContext context) {
    return section(classes: "custom-section limited-width", <Component>[
      h1(<Component>[.text(_title)]),
      div(_children),
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
        flexDirection: .row,
        flexWrap: .wrap,
        justifyContent: .center,
        alignItems: .center,
        gap: .all(32.px),
      ),
    ]),
  ];
}
