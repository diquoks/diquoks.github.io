import "package:diquoks_web/diquoks_web.dart";
import "package:jaspr/dom.dart";
import "package:jaspr/jaspr.dart";

class SkillIconDisplay extends StatelessComponent {
  const new({super.key, required this._skillIcon});

  final SkillIcon _skillIcon;

  @override
  Component build(BuildContext context) {
    return img(
      src: _skillIcon.image.src,
      classes: "skill-icon-display",
      attributes: <String, String>{"title": _skillIcon.toString()},
    );
  }

  @css
  static List<StyleRule> get styles => <StyleRule>[
    css(".skill-icon-display")
        .styles(display: .block, width: 32.px, height: 32.px),
  ];
}
