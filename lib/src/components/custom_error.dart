import "package:diquoks_web/diquoks_web.dart";
import "package:jaspr/dom.dart";
import "package:jaspr/jaspr.dart";

class CustomError extends StatelessComponent {
  const CustomError({
    super.key,
    required this._image,
    required this._title,
    required this._description,
  });

  final Image _image;
  final String _title;
  final String _description;

  @override
  Component build(BuildContext context) {
    return div(classes: "error", <Component>[
      img(src: _image.src),
      div(<Component>[
        h1(<Component>[.text(_title)]),
        p(<Component>[.text(_description)]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => <StyleRule>[
    css(".error", <StyleRule>[
      css("&").styles(
        display: .flex,
        flexDirection: .row,
        alignItems: .center,
        gap: .all(16.px),
      ),
      css("> img").styles(width: 112.px, height: 112.px),
      css("> div", <StyleRule>[
        css("&").styles(
          display: .flex,
          flexDirection: .column,
          gap: .all(8.px),
          color: Colors.white,
          textAlign: .left,
          fontFamily: CustomFonts.getFontFamilies(openSans: true),
        ),
        css("> h1").styles(fontSize: 24.px),
        css("> p").styles(fontSize: 14.px),
      ]),
    ]),
  ];
}
