import "package:diquoks_web/diquoks_web.dart";
import "package:jaspr/dom.dart";
import "package:jaspr/jaspr.dart";

class CustomFooter extends StatelessComponent {
  const new({super.key});

  @override
  Component build(BuildContext context) {
    return footer(classes: "custom-footer", <Component>[
      div(classes: "limited-width", <StatelessComponent>[
        const CustomLogo.website(),
        for (final Link footerLink in CustomData.footerLinks)
          a(
            href: footerLink.link,
            target: .blank,
            classes: "footer-link",
            <Component>[.text(footerLink.title)],
          ),
        const a(
          href: "https://jaspr.site",
          target: .blank,
          classes: "jaspr-badge",
          <Component>[
            span(<Component>[JasprBadge.light()]),
            span(<Component>[JasprBadge.lightTwoTone()]),
          ],
        ),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => <StyleRule>[
    css(".custom-footer", <StyleRule>[
      css("&").styles(
        display: .flex,
        padding: .only(left: 24.px, top: 48.px, right: 24.px, bottom: 16.px),
        justifyContent: .center,
        raw: <String, String>{"background-image": CustomColors.footerGradient},
      ),
      css("& > div", <StyleRule>[
        css("&").styles(
          display: .flex,
          flexDirection: .row,
          flexWrap: .wrap,
          justifyContent: .center,
          alignItems: .center,
          gap: Gap(row: 16.px, column: 48.px),
        ),
        css("& > .footer-link").styles(
          color: Colors.white,
          fontFamily: CustomFonts.getFontFamilies(openSans: true),
          fontSize: 14.px,
        ),
        css("& > .jaspr-badge", <StyleRule>[
          css("&").styles(width: 106.px, height: 40.px),
          css("&:hover", <StyleRule>[
            css("& > span:first-child").styles(display: .none),
            css("& > span:last-child").styles(display: .initial),
          ]),
          css("& > span:last-child").styles(display: .none),
        ]),
      ]),
    ]),
  ];
}
