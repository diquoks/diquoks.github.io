import "package:diquoks_web/diquoks_web.dart";
import "package:jaspr/dom.dart";
import "package:jaspr/jaspr.dart";
import "package:universal_web/js_interop.dart";
import "package:universal_web/web.dart" as web;

@client
class CustomCopyButton extends StatelessComponent {
  const CustomCopyButton({super.key, required this.title, required this.data});

  final String title;
  final String data;

  @override
  Component build(BuildContext context) {
    return button(
      type: .button,
      onClick: () => _copyData(data),
      classes: "custom-copy-button",
      attributes: <String, String>{"title": "Скопировать"},
      <Component>[.text("$title 📝")],
    );
  }

  Future<void> _copyData(String data) async {
    try {
      await web.window.navigator.clipboard.writeText(data).toDart;
    } catch (error) {
      web.console.warn("Copy feature is not available:\n$error".toJS);
    }
  }

  @css
  static List<StyleRule> get styles => <StyleRule>[
    css(".custom-copy-button").styles(
      cursor: .pointer,
      color: Colors.white,
      fontFamily: CustomFonts.getFontFamilies(openSans: true),
      fontSize: 14.px,
      textDecoration: const .new(line: .underline),
      backgroundColor: Colors.transparent,
    ),
  ];
}
