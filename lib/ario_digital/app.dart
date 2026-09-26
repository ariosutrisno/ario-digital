import 'package:flutter/material.dart';

import 'core/site_theme.dart';
import 'features/home/business_page.dart';

class ArioDigitalApp extends StatelessWidget {
  const ArioDigitalApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'ARIO DIGITAL — Solusi Digital untuk Bisnis',
    debugShowCheckedModeBanner: false,
    theme: SiteTheme.light,
    home: const BusinessPage(),
  );
}
