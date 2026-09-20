import "package:diquoks_web/diquoks_web.dart";
import "package:jaspr/dom.dart";

class const Image({required final String src}) extends Model;

class const BackgroundImage({
  required super.src,
  required final BackgroundImageContrast contrast,
  final bool isRepeating = false,
}) extends Image;

enum BackgroundImageContrast {
  light,
  dark;

  Color toColor() => switch (this) {
    .light => Colors.black,
    .dark => Colors.white,
  };
}
