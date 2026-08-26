import "package:diquoks_web/diquoks_web.dart";

class CustomData {
  const CustomData._();

  static const String title = "diquoks Web";
  static const String repositoryUrl =
      "https://github.com/diquoks/diquoks.github.io";

  static const List<Project> projects = <Project>[
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
      link: repositoryUrl,
      image: Image(src: "assets/images/projects/diquoks/LogoPeepoChat.webp"),
      backgroundImage: BackgroundImage(
        src: "assets/images/projects/diquoks/BackgroundLegacy.webp",
        contrast: .dark,
      ),
      skillIcon: .dart,
    ),
  ];

  static const List<Link> footerLinks = <Link>[
    Link(title: "Исходный код", link: repositoryUrl),
    Link(title: "Сделано diquoks ❤️", link: "https://github.com/diquoks"),
    Link(title: "Работает на GitHub Pages", link: "https://pages.github.com"),
  ];
}
