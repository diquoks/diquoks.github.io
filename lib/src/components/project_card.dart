import "package:diquoks_web/diquoks_web.dart";
import "package:jaspr/dom.dart";
import "package:jaspr/jaspr.dart";

class ProjectCard extends StatelessComponent {
  const ProjectCard({super.key, required this._project});

  final Project _project;

  @override
  Component build(BuildContext context) {
    return a(
      href: _project.link,
      target: .blank,
      classes: "project-card",
      styles: .combine(<Styles>[
        Styles(backgroundImage: .url(_project.backgroundImage.src)),
        _project.backgroundImage.isRepeat
            ? Styles(backgroundRepeat: .repeat)
            : Styles(backgroundSize: .cover),
      ]),
      <Component>[
        div(<Component>[
          CustomLogo(
            image: _project.image,
            title: _project.title,
            titleStyles: Styles(color: _project.backgroundImage.contrast.color),
          ),
          if (_project.skillIcon != null)
            SkillIconDisplay(skillIcon: _project.skillIcon!),
        ]),
        p(
          classes: "description",
          styles: Styles(color: _project.backgroundImage.contrast.color),
          <Component>[.text(_project.description)],
        ),
      ],
    );
  }

  @css
  static List<StyleRule> get styles => <StyleRule>[
    css(".project-card", <StyleRule>[
      css("&").styles(
        display: .flex,
        width: 300.px,
        aspectRatio: AspectRatio(11, 6),
        padding: .all(16.px),
        radius: .circular(16.px),
        transition: Transition("all", duration: 250.ms),
        flexDirection: .column,
        justifyContent: .spaceBetween,
        textDecoration: .none,
        backgroundPosition: .center,
      ),
      css("&:hover").styles(transform: .scale(1.05)),
      css("> div").styles(
        display: .flex,
        flexDirection: .row,
        justifyContent: .spaceBetween,
        alignItems: .center,
      ),
      css("> .description").styles(
        textAlign: .center,
        fontFamily: CustomFonts.getFontFamilies(openSans: true),
        fontSize: 14.px,
        whiteSpace: .preLine,
      ),
    ]),
  ];
}
