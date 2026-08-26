import "package:diquoks_web/diquoks_web.dart";
import "package:jaspr/dom.dart";
import "package:jaspr/jaspr.dart";

class CustomFooter extends StatelessComponent {
  const CustomFooter({super.key});

  @override
  Component build(BuildContext context) {
    return footer(<Component>[
      const CustomLogo.website(),
      for (final Link footerLink in CustomData.footerLinks)
        a(href: footerLink.link, target: .blank, classes: "link", <Component>[
          .text(footerLink.title),
        ]),
      const a(
        href: "https://jaspr.site",
        target: .blank,
        classes: "jaspr-badge",
        <Component>[
          span(<Component>[JasprBadge.light()]),
          span(<Component>[JasprBadge.lightTwoTone()]),
        ],
      ),
    ]);
  }

  @css
  static List<StyleRule> get styles => <StyleRule>[
    css("footer", <StyleRule>[
      css("&").styles(
        display: .flex,
        padding: .only(left: 16.px, top: 48.px, right: 16.px, bottom: 16.px),
        flexDirection: .row,
        flexWrap: .wrap,
        justifyContent: .center,
        alignItems: .center,
        gap: Gap(row: 16.px, column: 48.px),
        raw: <String, String>{
          "background-image":
              "linear-gradient(to top, ${CustomColors.shadow.value}, ${CustomColors.background.value})",
        },
      ),
      css("> .link").styles(
        color: Colors.white,
        fontFamily: CustomFonts.getFontFamilies(openSans: true),
        fontSize: 14.px,
      ),
      css("> .jaspr-badge", <StyleRule>[
        css("&").styles(width: 106.px, height: 40.px),
        css("&:hover", <StyleRule>[
          css("> span:first-child").styles(display: .none),
          css("> span:last-child").styles(display: .initial),
        ]),
        css("> span:last-child").styles(display: .none),
      ]),
    ]),
  ];
}
