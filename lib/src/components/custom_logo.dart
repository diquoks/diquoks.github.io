import "package:diquoks_web/diquoks_web.dart";
import "package:jaspr/dom.dart";
import "package:jaspr/jaspr.dart";

class CustomLogo extends StatelessComponent {
  const new({
    super.key,
    required this._image,
    this._link = "",
    required this._title,
    this._titleStyles,
  });

  const new website({super.key, this._titleStyles})
    : _image = const Image(src: "assets/favicons/logo.svg"),
      _link = "/",
      _title = CustomData.title;

  final Image _image;
  final String _link;
  final String _title;
  final Styles? _titleStyles;

  @override
  Component build(BuildContext context) {
    final Component logoImage = img(src: _image.src);

    return div(classes: "custom-logo", <Component>[
      _link.isNotEmpty ? a(href: _link, <Component>[logoImage]) : logoImage,
      p(styles: _titleStyles, <Component>[.text(_title)]),
    ]);
  }

  @css
  static List<StyleRule> get styles => <StyleRule>[
    css(".custom-logo", <StyleRule>[
      css("&").styles(
        display: .flex,
        flexDirection: .row,
        alignItems: .center,
        gap: .all(12.px),
      ),
      css("& > img, & > a > img")
          .styles(display: .block, width: 48.px, height: 48.px),
      css("& > p").styles(
        color: Colors.white,
        fontFamily: CustomFonts.getFontFamilies(openSans: true),
        fontSize: 18.px,
        fontWeight: .w700,
      ),
    ]),
  ];
}
