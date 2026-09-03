import "dart:io";

import "package:diquoks_web/diquoks_web.dart";
import "package:jaspr_riverpod/jaspr_riverpod.dart";
import "package:pubspec_parse/pubspec_parse.dart";

final Provider<WebsiteContent> websiteContentProvider =
    Provider<WebsiteContent>(
      (_) => WebsiteContent(
        pubspec: Pubspec.parse(File("pubspec.yaml").readAsStringSync()),
      ),
    );

class WebsiteContent {
  const WebsiteContent({required this._pubspec});

  final Pubspec _pubspec;

  String get name => _pubspec.name;

  String get title => "diquoks Web";

  String get description => _pubspec.description!;

  String get author => "Denis Titovets";

  String get homepage => _pubspec.homepage!;

  String get repository => _pubspec.repository!.toString();

  String get version => _pubspec.version!.toString();

  bool get isPreRelease => _pubspec.version!.isPreRelease;

  String get googleVerification =>
      "nwA1nG4U_7BR0tGVMR5dKq-UrTCAYrgy6HMtbqK10iw";

  String get yandexVerification => "8a46ea2d61d9b998";

  List<Project> get projects => <Project>[
    const Project(
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
      image: const Image(src: "assets/favicons/logo.svg"),
      backgroundImage: const BackgroundImage(
        src: "assets/images/projects/diquoks/BackgroundDark.webp",
        contrast: .dark,
      ),
      skillIcon: .dart,
    ),
    const Project(
      title: "ElkollegeSchedule",
      description: "Приложение для просмотра\nактуального расписания ЭК",
      link: "https://github.com/diquoks/ElkollegeScheduleApp",
      image: Image(src: "assets/images/projects/elkollege/LogoEK.webp"),
      backgroundImage: BackgroundImage(
        src: "assets/images/projects/elkollege/BackgroundEK.webp",
        contrast: .light,
        isRepeating: true,
      ),
      skillIcon: .flutter,
    ),
  ];

  List<Link> get footerLinks => <Link>[
    Link(title: "Исходный код", link: repository),
    const Link(title: "Сделано diquoks ❤️", link: "https://github.com/diquoks"),
    const Link(
      title: "Работает на GitHub Pages",
      link: "https://pages.github.com",
    ),
  ];
}
