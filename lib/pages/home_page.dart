import "package:diquoks_web/diquoks_web.dart";
import "package:jaspr/dom.dart";
import "package:jaspr/jaspr.dart";
import "package:jaspr_riverpod/jaspr_riverpod.dart";

class HomePage extends StatelessComponent {
  const new({super.key});

  static String get path => "/";

  @override
  Component build(BuildContext context) {
    final WebsiteContent content = context.read(websiteContentProvider);

    return main_(classes: "home-page", <Component>[
      CustomSection<Project>(
        content: content.projects,
        direction: .row,
        builder: (Project project) => ProjectCard(project: project),
      ),
    ]);
  }
}
