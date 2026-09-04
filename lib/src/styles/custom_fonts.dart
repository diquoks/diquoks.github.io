import "package:jaspr/dom.dart";

class CustomFonts {
  const CustomFonts._();

  static const String _openSansString = "OpenSans";
  static const FontFamily _openSansFamily = FontFamily(_openSansString);

  static FontFamily getFontFamilies({bool openSans = false}) => .list(
    <FontFamily>[if (openSans) _openSansFamily, FontFamilies.sansSerif],
  );

  @css
  static List<StyleRule> get styles => <StyleRule>[
    css.fontFace(
      family: _openSansString,
      style: .normal,
      url: "assets/fonts/open-sans/OpenSans.ttf",
    ),
    css.fontFace(
      family: _openSansString,
      style: .italic,
      url: "assets/fonts/open-sans/OpenSans-Italic.ttf",
    ),
  ];
}
