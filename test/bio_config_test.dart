import 'package:flutter_test/flutter_test.dart';
import 'package:portofolio/ario_digital/core/app_links.dart';

void main() {
  test('developer portfolio link is centralized', () {
    expect(
      AppLinks.portfolio,
      'https://ariosutrisno.github.io/portfolio-ario/',
    );
  });

  test('business contact integrations are left ready for configuration', () {
    expect(AppLinks.whatsapp, isEmpty);
    expect(AppLinks.email, isEmpty);
    expect(AppLinks.restaurantDemo, isEmpty);
    expect(AppLinks.companyDemo, isEmpty);
    expect(AppLinks.dashboardDemo, isEmpty);
  });
}
