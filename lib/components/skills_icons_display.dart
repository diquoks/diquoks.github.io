import "package:diquoks_web/diquoks_web.dart";
import "package:jaspr/dom.dart";
import "package:jaspr/jaspr.dart";

class SkillsIconsDisplay extends StatelessComponent {
  const SkillsIconsDisplay({super.key, required this._skillsIcons});

  final List<SkillsIcon> _skillsIcons;

  @override
  Component build(BuildContext context) {
    return div(classes: "skills-icons-display", <Component>[
      for (final SkillsIcon skillsIcon in _skillsIcons)
        img(
          src: skillsIcon.image.src,
          attributes: <String, String>{"title": skillsIcon.title},
        ),
    ]);
  }

  @css
  static List<StyleRule> get styles => <StyleRule>[
    css(".skills-icons-display", <StyleRule>[
      css("&").styles(
        display: .flex,
        flexDirection: .row,
        flexWrap: .wrapReverse,
        justifyContent: .center,
        gap: .all(4.px),
      ),
      css("& > img").styles(display: .block, width: 32.px, height: 32.px),
    ]),
  ];
}
