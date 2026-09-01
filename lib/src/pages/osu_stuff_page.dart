import "package:diquoks_web/diquoks_web.dart";
import "package:jaspr/dom.dart";
import "package:jaspr/jaspr.dart";

class OsuStuffPage extends StatelessComponent {
  const OsuStuffPage({super.key});

  @override
  Component build(BuildContext context) {
    return main_(classes: "osu-stuff-page", <Component>[
      CustomSection(
        title: "🖼️ Коллабы",
        direction: .column,
        children: CustomData.collabs
            .map((OsuCollab collab) => OsuImageMap(collab: collab))
            .toList(),
      ),
    ]);
  }
}
