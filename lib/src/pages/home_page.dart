import "package:diquoks_web/diquoks_web.dart";
import "package:jaspr/dom.dart";
import "package:jaspr/jaspr.dart";
import "package:jaspr_riverpod/jaspr_riverpod.dart";

class HomePage extends StatelessComponent {
  const HomePage({super.key});

  @override
  Component build(BuildContext context) {
    final WebsiteContent content = context.read(websiteContentProvider);

    return main_(classes: "home-page", <Component>[
      CustomSection(
        title: "⚒️ Проекты",
        children: content.projects
            .map((Project project) => ProjectCard(project: project))
            .toList(),
      ),
    ]);
  }
}
