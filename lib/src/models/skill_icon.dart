import "package:diquoks_web/diquoks_web.dart";

enum SkillIcon {
  csharp,
  dart,
  flutter,
  python,
  svg;

  @override
  String toString() => switch (this) {
    .csharp => "C#",
    .dart => "Dart",
    .flutter => "Flutter",
    .python => "Python",
    .svg => "SVG",
  };

  Image get image => Image(src: "/assets/images/skill-icons/$name.svg");
}
