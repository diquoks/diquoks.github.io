import "package:diquoks_web/diquoks_web.dart";
import "package:jaspr/dom.dart";
import "package:jaspr/jaspr.dart";

class OsuImageMap extends StatelessComponent {
  OsuImageMap({super.key, required this._collab});

  final OsuCollab _collab;

  @override
  Component build(BuildContext context) {
    return div(classes: "osu-image-map", <Component>[
      p(classes: "title", <Component>[.text(_collab.title)]),
      div(classes: "content", <Component>[
        img(src: _collab.image.src),
        for (final OsuCollabMember member in _collab.members)
          a(
            href: member.link,
            styles: Styles(
              position: .absolute(
                left: member.x.percent,
                top: member.y.percent,
              ),
              width: member.width.percent,
              height: member.height.percent,
            ),
            attributes: <String, String>{"title": member.username},
            .empty(),
          ),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => <StyleRule>[
    css(".osu-image-map", <StyleRule>[
      css("&").styles(display: .flex, flexDirection: .column, gap: .all(16.px)),
      css("& > .title").styles(
        color: Colors.white,
        textAlign: .center,
        fontFamily: CustomFonts.getFontFamilies(openSans: true),
        fontSize: 18.px,
        fontWeight: .w600,
      ),
      css("& > .content", <StyleRule>[
        css("&").styles(
          position: const .relative(),
          maxWidth: .maxContent,
          maxHeight: .maxContent,
        ),
        css("& > img").styles(
          display: .block,
          maxWidth: 100.percent,
          maxHeight: 100.percent,
        ),
      ]),
    ]),
  ];
}
