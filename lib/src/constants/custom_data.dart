import "package:diquoks_web/diquoks_web.dart";

class CustomData {
  const CustomData._();

  static const String title = "diquoks Web";
  static const String author = "Denis Titovets";
  static const String repositoryUrl =
      "https://github.com/diquoks/diquoks.github.io";

  static const String googleVerification =
      "nwA1nG4U_7BR0tGVMR5dKq-UrTCAYrgy6HMtbqK10iw";
  static const String yandexVerification = "8a46ea2d61d9b998";

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
      image: Image(src: "assets/favicons/logo.svg"),
      backgroundImage: BackgroundImage(
        src: "assets/images/projects/diquoks/BackgroundDark.webp",
        contrast: .dark,
      ),
      skillIcon: .dart,
    ),
    Project(
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

  static const List<Link> footerLinks = <Link>[
    Link(title: "Исходный код", link: repositoryUrl),
    Link(title: "Сделано diquoks ❤️", link: "https://github.com/diquoks"),
    Link(title: "Работает на GitHub Pages", link: "https://pages.github.com"),
  ];
}
