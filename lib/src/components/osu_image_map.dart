import "package:diquoks_web/diquoks_web.dart";
import "package:jaspr/dom.dart";
import "package:jaspr/jaspr.dart";
import "package:jaspr_riverpod/jaspr_riverpod.dart";

class OsuImageMap extends StatelessComponent {
  const OsuImageMap({super.key, required this._collab});

  final OsuCollab _collab;

  @override
  Component build(BuildContext context) {
    final WebsiteContent content = context.read(websiteContentProvider);

    return div(classes: "osu-image-map", <Component>[
      div(classes: "title", <Component>[
        p(<Component>[.text(_collab.title)]),
        CustomCopyButton(title: "BBCode", data: _collab.bbcode(content)),
      ]),
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
      css("& > .title", <StyleRule>[
        css("&").styles(
          display: .flex,
          flexDirection: .row,
          justifyContent: .spaceBetween,
          alignItems: .center,
        ),
        css("& > p").styles(
          color: Colors.white,
          fontFamily: CustomFonts.getFontFamilies(openSans: true),
          fontSize: 18.px,
          fontWeight: .w600,
        ),
      ]),
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
