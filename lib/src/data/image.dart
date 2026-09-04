import "package:diquoks_web/diquoks_web.dart";
import "package:jaspr/dom.dart";

class Image extends Model {
  const Image({required this.src});

  final String src;
}

class BackgroundImage extends Image {
  const BackgroundImage({
    required super.src,
    required this.contrast,
    this.isRepeating = false,
  });

  final BackgroundImageContrast contrast;
  final bool isRepeating;
}

enum BackgroundImageContrast {
  light,
  dark;

  Color get color => switch (this) {
    .light => Colors.black,
    .dark => Colors.white,
  };
}
