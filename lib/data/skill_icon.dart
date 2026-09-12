import "package:diquoks_web/diquoks_web.dart";

enum SkillIcon {
  csharp,
  dart,
  flutter,
  python;

  String get title => switch (this) {
    .csharp => "C#",
    .dart => "Dart",
    .flutter => "Flutter",
    .python => "Python",
  };

  Image get image => .new(src: "assets/images/skill-icons/$name.svg");
}
