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
      image: Image(src: "/assets/images/projects/osu/CookieLazer.svg"),
      backgroundImage: BackgroundImage(
        src: "/assets/images/projects/osu/BackgroundLazer.svg",
        contrast: .dark,
      ),
      skillIcon: .csharp,
    ),
    Project(
      title: title,
      description:
          "Скоро превратится в сайт-визитку,\nно до этого ещё далеко...",
      link: repository,
      image: Image(src: "/assets/images/projects/diquoks/LogoPeepoChat.webp"),
      backgroundImage: BackgroundImage(
        src: "/assets/images/projects/diquoks/BackgroundLegacy.png",
        contrast: .dark,
      ),
      skillIcon: .dart,
    ),
    Project(
      title: "pyquoks",
      description:
          "Пакет PyPI для часто используемых\nмодулей в проектах diquoks",
      link: "https://github.com/diquoks/pyquoks",
      image: Image(src: "/assets/favicons/logo.svg"),
      backgroundImage: BackgroundImage(
        src: "/assets/images/projects/diquoks/BackgroundDark.png",
        contrast: .dark,
      ),
      skillIcon: .python,
    ),
    Project(
      title: "Elkollege",
      description: "Инструменты, упрощающие\nповседневную жизнь колледжа",
      link: "https://github.com/elkollege",
      image: Image(src: "/assets/images/projects/elkollege/LogoEK.webp"),
      backgroundImage: BackgroundImage(
        src: "/assets/images/projects/elkollege/BackgroundEK.webp",
        contrast: .light,
        isRepeat: true,
      ),
      skillIcon: null,
    ),
    Project(
      title: "diquoks Assets",
      description: "Ресурсы для проектов diquoks",
      link: "https://github.com/diquoks/diquoks-assets",
      image: Image(src: "/assets/favicons/logo.svg"),
      backgroundImage: BackgroundImage(
        src: "/assets/images/projects/diquoks/BackgroundLight.png",
        contrast: .dark,
      ),
      skillIcon: .svg,
    ),
  ];

  static List<Link> get footerLinks => <Link>[
    Link(title: "Исходный код", link: repository),
    Link(title: "Сделано diquoks ❤️", link: "https://github.com/diquoks"),
    Link(title: "Работает на GitHub Pages", link: "https://pages.github.com"),
  ];
}
