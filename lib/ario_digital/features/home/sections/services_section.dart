import 'package:flutter/material.dart';
import '../../../core/site_data.dart';
import '../../../core/site_theme.dart';
import '../../../core/site_widgets.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key, required this.onContact});
  final VoidCallback onContact;

  @override
  Widget build(BuildContext context) => SiteSection(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeading(
          kicker: 'Yang bisa saya bantu',
          title: 'Kebutuhan berbeda.\nPendekatan yang tepat.',
          description:
              'Pilih layanan untuk melihat detailnya. Belum tahu yang dibutuhkan? Kita bisa mulai dari diskusi.',
        ),
        const SizedBox(height: 36),
        for (final service in services)
          Container(
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: SiteColors.line)),
            ),
            child: Theme(
              data: Theme.of(
                context,
              ).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                tilePadding: const EdgeInsets.symmetric(vertical: 12),
                childrenPadding: const EdgeInsets.only(left: 0, bottom: 24),
                leading: Text(
                  service.number,
                  style: const TextStyle(fontSize: 12, color: SiteColors.muted),
                ),
                title: Text(
                  service.title,
                  style: const TextStyle(
                    fontFamily: 'Manrope',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: SiteColors.text,
                  ),
                ),
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 640),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            service.description,
                            style: const TextStyle(
                              fontSize: 15,
                              height: 1.8,
                              color: SiteColors.muted,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            service.tags.join(' / '),
                            style: const TextStyle(
                              fontSize: 12,
                              color: SiteColors.primary,
                            ),
                          ),
                          const SizedBox(height: 12),
                          TextButton(
                            onPressed: onContact,
                            child: const Text('Diskusikan kebutuhan ini ↗'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    ),
  );
}
