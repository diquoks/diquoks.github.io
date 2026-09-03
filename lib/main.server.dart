import "package:diquoks_web/diquoks_web.dart";
import "package:diquoks_web/main.server.options.dart";
import "package:jaspr/server.dart";
import "package:jaspr_riverpod/jaspr_riverpod.dart";

void main() {
  Jaspr.initializeApp(options: defaultServerOptions);

  runApp(const ProviderScope(child: Application()));
}
