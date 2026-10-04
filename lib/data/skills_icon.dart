import "package:diquoks_web/diquoks_web.dart";

enum SkillsIcon {
  csharp,
  dart,
  flutter,
  jaspr;

  String get title => switch (this) {
    .csharp => "C#",
    .dart => "Dart",
    .flutter => "Flutter",
    .jaspr => "Jaspr",
  };

  Image get image => .new(src: "assets/images/skills-icons/$name.svg");
}
