import "package:diquoks_web/diquoks_web.dart";

enum SkillIcon {
  csharp,
  dart,
  flutter,
  python;

  @override
  String toString() => switch (this) {
    .csharp => "C#",
    .dart => "Dart",
    .flutter => "Flutter",
    .python => "Python",
  };

  Image get image => Image(src: "assets/images/skill-icons/$name.svg");
}
