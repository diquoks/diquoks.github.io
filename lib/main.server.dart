import "dart:io";

import "package:diquoks_web/diquoks_web.dart";
import "package:diquoks_web/main.server.options.dart";
import "package:jaspr/server.dart";
import "package:pubspec_parse/pubspec_parse.dart";

void main() {
  Jaspr.initializeApp(options: defaultServerOptions);

  final Pubspec pubspec = Pubspec.parse(
    File("pubspec.yaml").readAsStringSync(),
  );

  runApp(ServerApplication(pubspec: pubspec));
}
