// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/server.dart';
import 'package:diquoks_web/src/components/custom_copy_button.dart'
    as _custom_copy_button;

/// Default [ServerOptions] for use with your Jaspr project.
///
/// Use this to initialize Jaspr **before** calling [runApp].
///
/// Example:
/// ```dart
/// import 'main.server.options.dart';
///
/// void main() {
///   Jaspr.initializeApp(
///     options: defaultServerOptions,
///   );
///
///   runApp(...);
/// }
/// ```
ServerOptions get defaultServerOptions => ServerOptions(
  clientId: 'main.client.dart.js',
  clients: {
    _custom_copy_button.CustomCopyButton:
        ClientTarget<_custom_copy_button.CustomCopyButton>(
          'custom_copy_button',
          params: __custom_copy_buttonCustomCopyButton,
        ),
  },
  stylesId: 'main.css',
);

Map<String, Object?> __custom_copy_buttonCustomCopyButton(
  _custom_copy_button.CustomCopyButton c,
) => {'title': c.title, 'data': c.data};
