import 'package:flutter_test/flutter_test.dart';
import 'package:portofolio/ario_digital/core/site_theme.dart';

void main() {
  test('business theme uses the ARIO DIGITAL palette', () {
    expect(SiteTheme.light.scaffoldBackgroundColor, SiteColors.background);
    expect(SiteTheme.light.colorScheme.primary, SiteColors.primary);
    expect(SiteColors.surface, isNot(SiteColors.background));
  });

  test('body copy keeps readable contrast on the main background', () {
    final foreground = SiteColors.muted.computeLuminance();
    final background = SiteColors.background.computeLuminance();
    final brighter = foreground > background ? foreground : background;
    final darker = foreground > background ? background : foreground;

    expect((brighter + .05) / (darker + .05), greaterThanOrEqualTo(4.5));
  });
}
