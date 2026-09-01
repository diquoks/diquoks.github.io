import "package:diquoks_web/diquoks_web.dart";
import "package:jaspr/dom.dart";

class BackgroundImage extends Image {
  const new({
    required super.src,
    required this.contrast,
    this.isRepeat = false,
  });

  final BackgroundImageContrast contrast;
  final bool isRepeat;
}

enum BackgroundImageContrast {
  light,
  dark;

  Color get color => switch (this) {
    .light => Colors.black,
    .dark => Colors.white,
  };
}
