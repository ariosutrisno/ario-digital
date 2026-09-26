import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portofolio/ario_digital/app.dart';

void main() {
  const viewports = <String, Size>{
    'mobile': Size(320, 720),
    'tablet': Size(768, 1024),
    'desktop': Size(1440, 900),
  };

  for (final viewport in viewports.entries) {
    testWidgets('business landing page renders at ${viewport.key}', (
      tester,
    ) async {
      tester.view.devicePixelRatio = 1;
      tester.view.physicalSize = viewport.value;
      final layoutErrors = <String>[];
      final originalHandler = FlutterError.onError;
      FlutterError.onError = (details) {
        layoutErrors.add(details.toString());
        originalHandler?.call(details);
      };
      addTearDown(() {
        FlutterError.onError = originalHandler;
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(const ArioDigitalApp());

      expect(find.text('ARIO'), findsWidgets);
      expect(find.text('Ceritakan Project-mu'), findsOneWidget);
      expect(tester.takeException(), isNull, reason: layoutErrors.join('\n'));
    });
  }
}
