import "package:diquoks_web/diquoks_web.dart";
import "package:jaspr/dom.dart";
import "package:jaspr/jaspr.dart";

class CustomHeader extends StatelessComponent {
  const CustomHeader({super.key});

  @override
  Component build(BuildContext context) {
    return header(<Component>[
      div(classes: "content", <Component>[
        CustomLogo.website(),
        a(
          href: "${CustomData.repository}/releases",
          target: .blank,
          attributes: <String, String>{"title": "Версия сайта"},
          <Component>[.text(CustomData.version)],
        ),
      ]),
      if (CustomData.isUnderConstruction)
        div(classes: "under-construction-tape", .empty()),
    ]);
  }

  @css
  static List<StyleRule> get styles => <StyleRule>[
    css("header", <StyleRule>[
      css("&").styles(
        display: .flex,
        position: .sticky(top: .zero),
        zIndex: ZIndex(9999),
        width: 100.percent,
        flexDirection: .column,
      ),
      css("> .content", <StyleRule>[
        css("&").styles(
          display: .flex,
          padding: .symmetric(vertical: 16.px, horizontal: 24.px),
          flexDirection: .row,
          justifyContent: .spaceBetween,
          alignItems: .center,
          backgroundColor: CustomColors.shadow,
          raw: <String, String>{
            "background-blend-mode": "color",
            "background-image":
                "linear-gradient(to top left, #73A5FF, #FF4BFF), linear-gradient(to top right, #5F55FF, #EC76FF)",
          },
        ),
        css("> a").styles(
          color: Colors.white,
          fontFamily: CustomFonts.getFontFamilies(openSans: true),
          fontSize: 14.px,
          fontWeight: .w600,
        ),
      ]),
      css(".under-construction-tape").styles(
        height: 8.px,
        backgroundImage: .url("/assets/images/under-construction-tape.svg"),
        backgroundPosition: .center,
        backgroundRepeat: .repeatX,
      ),
    ]),
  ];
}
