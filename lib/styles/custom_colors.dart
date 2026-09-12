import "package:jaspr/dom.dart";

abstract final class CustomColors {
  static const Color background = .new("#111111");
  static const Color shadow = .new("#0000007F");

  static const Color _headerTopLeft = .new("#FF00FF");
  static const Color _headerTopRight = .new("#FF65FF");
  static const Color _headerBottomLeft = .new("#7052FF");
  static const Color _headerBottomRight = .new("#569CFF");

  static String get headerGradient =>
      "linear-gradient(to top left, ${_headerBottomRight.value}, ${_headerTopLeft.value}), "
      "linear-gradient(to top right, ${_headerBottomLeft.value}, ${_headerTopRight.value})";

  static String get footerGradient =>
      "linear-gradient(to top, ${shadow.value}, ${background.value})";
}
