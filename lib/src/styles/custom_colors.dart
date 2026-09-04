import "package:jaspr/dom.dart";

abstract final class CustomColors {
  static const Color background = Color("#111111");
  static const Color shadow = Color("#0000007F");

  static const Color _headerTopLeft = Color("#FF00FF");
  static const Color _headerTopRight = Color("#FF65FF");
  static const Color _headerBottomLeft = Color("#7052FF");
  static const Color _headerBottomRight = Color("#569CFF");

  static String get headerGradient =>
      "linear-gradient(to top left, ${_headerBottomRight.value}, ${_headerTopLeft.value}), linear-gradient(to top right, ${_headerBottomLeft.value}, ${_headerTopRight.value})";

  static String get footerGradient =>
      "linear-gradient(to top, ${shadow.value}, ${background.value})";
}
