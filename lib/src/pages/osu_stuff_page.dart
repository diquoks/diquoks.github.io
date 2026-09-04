import "package:diquoks_web/diquoks_web.dart";
import "package:jaspr/dom.dart";
import "package:jaspr/jaspr.dart";
import "package:jaspr_riverpod/jaspr_riverpod.dart";

class OsuStuffPage extends StatelessComponent {
  const OsuStuffPage({super.key});

  @override
  Component build(BuildContext context) {
    final WebsiteContent content = context.read(websiteContentProvider);

    return main_(classes: "osu-stuff-page", <Component>[
      CustomSection<OsuCollab>(
        content: content.collabs,
        direction: .column,
        builder: (OsuCollab collab) => OsuImageMap(collab: collab),
      ),
    ]);
  }
}
