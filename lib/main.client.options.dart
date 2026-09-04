// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/client.dart';

import 'package:diquoks_web/src/components/custom_copy_button.dart'
    deferred as _custom_copy_button;

/// Default [ClientOptions] for use with your Jaspr project.
///
/// Use this to initialize Jaspr **before** calling [runApp].
///
/// Example:
/// ```dart
/// import 'main.client.options.dart';
///
/// void main() {
///   Jaspr.initializeApp(
///     options: defaultClientOptions,
///   );
///
///   runApp(...);
/// }
/// ```
ClientOptions get defaultClientOptions => ClientOptions(
  clients: {
    'custom_copy_button': ClientLoader(
      (p) => _custom_copy_button.CustomCopyButton(
        title: p['title'] as String,
        data: p['data'] as String,
      ),
      loader: _custom_copy_button.loadLibrary,
    ),
  },
);
