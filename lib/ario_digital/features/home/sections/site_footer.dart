import 'package:flutter/material.dart';
import '../../../core/site_theme.dart';
import '../../../core/site_widgets.dart';

class SiteFooter extends StatelessWidget {
  const SiteFooter({
    super.key,
    required this.onNavigate,
    required this.onDeveloper,
  });
  final ValueChanged<String> onNavigate;
  final VoidCallback onDeveloper;
  @override
  Widget build(BuildContext context) => Container(
    color: SiteColors.backgroundAlt,
    padding: const EdgeInsets.symmetric(vertical: 40),
    child: SiteContainer(
      child: Column(
        children: [
          LayoutBuilder(
            builder: (context, box) => box.maxWidth < 650
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _brand(context),
                      const SizedBox(height: 28),
                      _links(),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _brand(context)),
                      _links(),
                    ],
                  ),
          ),
          const SizedBox(height: 30),
          const Divider(color: SiteColors.line),
          const SizedBox(height: 18),
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            runSpacing: 12,
            spacing: 24,
            children: [
              Text(
                '© ${DateTime.now().year} ARIO DIGITAL. Hak cipta dilindungi.',
                style: const TextStyle(color: SiteColors.muted, fontSize: 11),
              ),
              InkWell(
                onTap: onDeveloper,
                child: const Text(
                  'About the Developer ↗',
                  style: TextStyle(
                    color: SiteColors.primary,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Designed & developed by Ario Sutrisno',
              style: TextStyle(color: SiteColors.muted, fontSize: 10),
            ),
          ),
        ],
      ),
    ),
  );
  Widget _brand(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          const Icon(
            Icons.blur_on_rounded,
            color: SiteColors.primary,
            size: 23,
          ),
          const SizedBox(width: 8),
          Text(
            'ARIO',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(letterSpacing: 2, fontSize: 17),
          ),
          const SizedBox(width: 5),
          const Text(
            'DIGITAL',
            style: TextStyle(
              color: SiteColors.primary,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.5,
              fontSize: 10,
            ),
          ),
        ],
      ),
      const SizedBox(height: 9),
      const Text(
        'Solusi digital praktis untuk bisnis modern.',
        style: TextStyle(color: SiteColors.muted, fontSize: 12),
      ),
    ],
  );
  Widget _links() => Wrap(
    spacing: 17,
    runSpacing: 10,
    children: [
      for (final entry in const [
        ('Layanan', 'services'),
        ('Project', 'projects'),
        ('Harga', 'pricing'),
        ('Proses', 'process'),
        ('Kontak', 'contact'),
      ])
        InkWell(
          onTap: () => onNavigate(entry.$2),
          child: Text(
            entry.$1,
            style: const TextStyle(color: SiteColors.muted, fontSize: 11),
          ),
        ),
    ],
  );
}
