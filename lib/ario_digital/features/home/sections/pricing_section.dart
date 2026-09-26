import 'package:flutter/material.dart';
import '../../../core/site_theme.dart';
import '../../../core/site_widgets.dart';

class PricingSection extends StatelessWidget {
  const PricingSection({super.key, required this.onContact});
  final VoidCallback onContact;
  static const plans = [
    (
      'STARTER',
      'Landing page',
      'Mulai dari Rp —',
      [
        'Satu halaman responsif',
        'Informasi bisnis & CTA',
        'Integrasi kontak',
        'Struktur SEO dasar',
      ],
      false,
    ),
    (
      'BUSINESS',
      'Company profile',
      'Mulai dari Rp —',
      [
        'Website multi-section',
        'Profil & layanan',
        'Portofolio & kontak',
        'Desain responsif',
      ],
      true,
    ),
    (
      'CUSTOM SYSTEM',
      'Aplikasi & dashboard',
      'Penawaran khusus',
      [
        'Analisis kebutuhan',
        'UI khusus bisnis',
        'Database & API',
        'Alur kerja & autentikasi',
      ],
      false,
    ),
  ];
  @override
  Widget build(BuildContext context) => SiteSection(
    id: 'pricing',
    background: true,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeading(
          kicker: 'PAKET PROJECT',
          title: 'Mulai dari kebutuhanmu.',
          description:
              'Setiap bisnis punya kebutuhan berbeda. Harga final ditentukan setelah lingkup dan prioritas project dibahas bersama.',
        ),
        const SizedBox(height: 40),
        LayoutBuilder(
          builder: (context, constraints) {
            const gap = 16.0;
            final columns = ((constraints.maxWidth + gap) / (300 + gap))
                .floor()
                .clamp(1, 3);
            final cardWidth =
                (constraints.maxWidth - gap * (columns - 1)) / columns;

            return Column(
              children: [
                for (var start = 0; start < plans.length; start += columns)
                  Padding(
                    padding: EdgeInsets.only(top: start == 0 ? 0 : gap),
                    child: IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          for (
                            var offset = 0;
                            offset < columns && start + offset < plans.length;
                            offset++
                          ) ...[
                            if (offset > 0) const SizedBox(width: gap),
                            SizedBox(
                              width: cardWidth,
                              child: _PriceCard(
                                plan: plans[start + offset],
                                onContact: onContact,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
        const SizedBox(height: 18),
        const Text(
          'Harga akhir bergantung pada lingkup project, fitur, integrasi, timeline, dan kebutuhan maintenance.',
          style: TextStyle(fontSize: 12, color: SiteColors.muted),
        ),
      ],
    ),
  );
}

class _PriceCard extends StatelessWidget {
  const _PriceCard({required this.plan, required this.onContact});
  final (String, String, String, List<String>, bool) plan;
  final VoidCallback onContact;
  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: plan.$5 ? SiteColors.accentSurface : SiteColors.surface,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color: plan.$5
            ? SiteColors.primary.withValues(alpha: .65)
            : SiteColors.line,
      ),
    ),
    padding: const EdgeInsets.all(24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 12,
          runSpacing: 8,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              plan.$1,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: SiteColors.primary,
                letterSpacing: 1.6,
              ),
            ),
            if (plan.$5)
              const Tag(
                'POPULAR',
                color: SiteColors.text,
                backgroundColor: SiteColors.highlight,
              ),
          ],
        ),
        const SizedBox(height: 15),
        Text(
          plan.$2,
          style: const TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w700,
            color: SiteColors.text,
          ),
        ),
        const SizedBox(height: 13),
        Text(
          plan.$3,
          style: const TextStyle(
            fontFamily: 'Manrope',
            fontSize: 23,
            fontWeight: FontWeight.w700,
            color: SiteColors.text,
          ),
        ),
        const SizedBox(height: 20),
        const Divider(color: SiteColors.line),
        for (final feature in plan.$4)
          Padding(
            padding: const EdgeInsets.only(top: 13),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.check_circle_rounded,
                  color: SiteColors.primary,
                  size: 16,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    feature,
                    style: const TextStyle(
                      fontSize: 12,
                      color: SiteColors.muted,
                    ),
                  ),
                ),
              ],
            ),
          ),
        const Spacer(),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: plan.$5
              ? PrimaryAction(label: 'Diskusikan paket', onPressed: onContact)
              : OutlineAction(
                  label: 'Konsultasi project',
                  onPressed: onContact,
                ),
        ),
      ],
    ),
  );
}
