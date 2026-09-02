import "package:diquoks_web/diquoks_web.dart";
import "package:jaspr/dom.dart";
import "package:jaspr/jaspr.dart";

class HomePage extends StatelessComponent {
  const new({super.key});

  @override
  Component build(BuildContext context) {
    return main_(classes: "home-page", <Component>[
      CustomSection(
        title: "⚒️ Проекты",
        children: CustomData.projects
            .map((Project project) => ProjectCard(project: project))
            .toList(),
      ),
    ]);
  }
}
