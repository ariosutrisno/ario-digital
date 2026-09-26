import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portofolio/ario_digital/core/site_theme.dart';
import 'package:portofolio/ario_digital/features/home/sections/pricing_section.dart';

void main() {
  for (final width in [320.0, 375.0, 768.0, 1024.0, 1200.0, 1440.0]) {
    for (final scale in [1.0, 1.5, 2.0]) {
      testWidgets('pricing fits ${width}px with ${scale}x text', (
        tester,
      ) async {
        tester.view.devicePixelRatio = 1;
        tester.view.physicalSize = Size(width, 900);
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);
        var inquiries = 0;

        await tester.pumpWidget(
          MaterialApp(
            theme: SiteTheme.light,
            builder: (context, child) => MediaQuery(
              data: MediaQuery.of(
                context,
              ).copyWith(textScaler: TextScaler.linear(scale)),
              child: child!,
            ),
            home: Scaffold(
              body: SingleChildScrollView(
                child: PricingSection(onContact: () => inquiries++),
              ),
            ),
          ),
        );

        expect(tester.takeException(), isNull);
        final action = find.text('Diskusikan paket');
        await tester.ensureVisible(action);
        await tester.pumpAndSettle();
        await tester.tap(action);
        expect(inquiries, 1);
        expect(tester.takeException(), isNull);
      });
    }
  }
}
