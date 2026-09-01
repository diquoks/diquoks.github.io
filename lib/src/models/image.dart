import "package:jaspr/dom.dart";

class const Image({required final String src});

class const BackgroundImage({
  required super.src,
  required final BackgroundImageContrast contrast,
  final bool isRepeating = false,
}) extends Image;

enum BackgroundImageContrast {
  light,
  dark;

  Color get color => switch (this) {
    .light => Colors.black,
    .dark => Colors.white,
  };
}
