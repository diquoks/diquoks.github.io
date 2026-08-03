import "package:diquoks_web/main.client.options.dart";
import "package:jaspr/client.dart";

void main() {
  Jaspr.initializeApp(options: defaultClientOptions);

  runApp(ClientApp());
}
