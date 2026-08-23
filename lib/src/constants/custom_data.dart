import "dart:io";

import "package:diquoks_web/diquoks_web.dart";
import "package:pubspec_parse/pubspec_parse.dart";

class CustomData {
  const CustomData._();

  static const String title = "diquoks Web";

  static final Pubspec _pubspec = Pubspec.parse(
    File("pubspec.yaml").readAsStringSync(),
  );

  static String get name => _pubspec.name;

  static String get description => _pubspec.description!;

  static String get homepage => _pubspec.homepage!;

  static String get repository => _pubspec.repository!.toString();

  static String get version => _pubspec.version!.canonicalizedVersion;

  static bool get isUnderConstruction => _pubspec.version!.isPreRelease;

  static List<Project> get projects => <Project>[
    Project(
      title: "osu!",
      description: "rhythm is just a *click* away!",
      link: "https://github.com/diquoks/osu",
      image: Image(src: "assets/images/projects/osu/CookieLazer.svg"),
      backgroundImage: BackgroundImage(
        src: "assets/images/projects/osu/BackgroundLazer.svg",
        contrast: .dark,
      ),
      skillIcon: .csharp,
    ),
    Project(
      title: title,
      description:
          "Скоро превратится в сайт-визитку,\nно до этого ещё далеко...",
      link: repository,
      image: Image(src: "assets/images/projects/diquoks/LogoPeepoChat.webp"),
      backgroundImage: BackgroundImage(
        src: "assets/images/projects/diquoks/BackgroundLegacy.png",
        contrast: .dark,
      ),
      skillIcon: .dart,
    ),
  ];

  static List<Link> get footerLinks => <Link>[
    Link(title: "Исходный код", link: repository),
    Link(title: "Сделано diquoks ❤️", link: "https://github.com/diquoks"),
    Link(title: "Работает на GitHub Pages", link: "https://pages.github.com"),
  ];
}
