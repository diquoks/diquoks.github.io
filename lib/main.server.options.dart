// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/server.dart';
import 'package:diquoks_web/components/application.dart' as _application;
import 'package:diquoks_web/components/custom_copy_button.dart'
    as _custom_copy_button;
import 'package:diquoks_web/components/custom_error.dart' as _custom_error;
import 'package:diquoks_web/components/custom_footer.dart' as _custom_footer;
import 'package:diquoks_web/components/custom_header.dart' as _custom_header;
import 'package:diquoks_web/components/custom_logo.dart' as _custom_logo;
import 'package:diquoks_web/components/custom_section.dart' as _custom_section;
import 'package:diquoks_web/components/osu_image_map.dart' as _osu_image_map;
import 'package:diquoks_web/components/project_card.dart' as _project_card;
import 'package:diquoks_web/components/skill_icon_display.dart'
    as _skill_icon_display;
import 'package:diquoks_web/pages/not_found_page.dart' as _not_found_page;
import 'package:diquoks_web/styles/custom_fonts.dart' as _custom_fonts;

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
  styles: () => [
    ..._application.Application.styles,
    ..._custom_copy_button.CustomCopyButton.styles,
    ..._custom_error.CustomError.styles,
    ..._custom_footer.CustomFooter.styles,
    ..._custom_header.CustomHeader.styles,
    ..._custom_logo.CustomLogo.styles,
    ..._custom_section.CustomSection.styles,
    ..._osu_image_map.OsuImageMap.styles,
    ..._project_card.ProjectCard.styles,
    ..._skill_icon_display.SkillIconDisplay.styles,
    ..._not_found_page.NotFoundPage.styles,
    ..._custom_fonts.CustomFonts.styles,
  ],
);

Map<String, Object?> __custom_copy_buttonCustomCopyButton(
  _custom_copy_button.CustomCopyButton c,
) => {'title': c.title, 'data': c.data};
