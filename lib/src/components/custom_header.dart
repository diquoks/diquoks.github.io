import "package:diquoks_web/diquoks_web.dart";
import "package:jaspr/dom.dart";
import "package:jaspr/jaspr.dart";
import "package:jaspr_riverpod/jaspr_riverpod.dart";

class CustomHeader extends StatelessComponent {
  const CustomHeader({super.key});

  @override
  Component build(BuildContext context) {
    final WebsiteContent content = context.read(websiteContentProvider);

    return header(classes: "custom-header", <Component>[
      div(classes: "content", <Component>[
        div(classes: "limited-width", <Component>[
          CustomLogo.website(title: content.title),
          a(
            href: "${content.repository}/releases",
            target: .blank,
            attributes: <String, String>{"title": "Версия сайта"},
            <Component>[.text(content.version)],
          ),
        ]),
      ]),
      if (content.isPreRelease)
        div(classes: "under-construction-tape", .empty()),
    ]);
  }

  @css
  static List<StyleRule> get styles => <StyleRule>[
    css(".custom-header", <StyleRule>[
      css("&").styles(
        display: .flex,
        position: const .sticky(top: .zero),
        zIndex: const .new(9999),
        width: 100.percent,
        flexDirection: .column,
      ),
      css("& > .content", <StyleRule>[
        css("&").styles(
          display: .flex,
          padding: .symmetric(vertical: 16.px, horizontal: 24.px),
          justifyContent: .center,
          backgroundColor: CustomColors.shadow,
          raw: <String, String>{
            "background-blend-mode": "color",
            "background-image": CustomColors.headerGradient,
          },
        ),
        css("& > div", <StyleRule>[
          css("&").styles(
            display: .flex,
            flexDirection: .row,
            justifyContent: .spaceBetween,
            alignItems: .center,
          ),
          css("& > a").styles(
            color: Colors.white,
            fontFamily: CustomFonts.getFontFamilies(openSans: true),
            fontSize: 14.px,
            fontWeight: .w600,
          ),
        ]),
      ]),
      css(".under-construction-tape").styles(
        height: 8.px,
        backgroundImage: const .url(
          "assets/images/under-construction-tape.svg",
        ),
        backgroundPosition: .center,
        backgroundRepeat: .repeatX,
      ),
    ]),
  ];
}
