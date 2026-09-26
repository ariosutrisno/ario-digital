import 'package:flutter/material.dart';
import '../../../core/site_theme.dart';
import '../../../core/site_widgets.dart';

class ProcessSection extends StatelessWidget {
  const ProcessSection({super.key});
  static const steps = [
    ('01', 'Diskusi', 'Kenali bisnis, masalah, tujuan, dan pengguna.'),
    ('02', 'Analisis', 'Rangkum kebutuhan menjadi lingkup yang jelas.'),
    ('03', 'Desain', 'Rancang UI, alur, data, dan pendekatan teknis.'),
    ('04', 'Kembangkan', 'Bangun solusi sesuai kesepakatan project.'),
    ('05', 'Uji', 'Tinjau fungsi, tampilan, dan pengalaman.'),
    ('06', 'Rilis', 'Siapkan produk di hosting atau platform pilihan.'),
    ('07', 'Dukung', 'Lanjutkan perawatan dan peningkatan produk.'),
  ];
  @override
  Widget build(BuildContext context) => SiteSection(
    id: 'process',
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeading(
          kicker: 'PROSES PENGEMBANGAN',
          title: 'Alur yang jelas, dari ide sampai rilis.',
          description:
              'Kamu tahu apa yang sedang dikerjakan dan apa langkah berikutnya di setiap tahap.',
        ),
        const SizedBox(height: 38),
        LayoutBuilder(
          builder: (context, box) {
            final compact = box.maxWidth < 700;
            return Column(
              children: [
                for (var i = 0; i < steps.length; i++)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 42,
                        child: Column(
                          children: [
                            Container(
                              width: 34,
                              height: 34,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: i == 0
                                    ? SiteColors.primary
                                    : SiteColors.surface,
                                border: Border.all(
                                  color: SiteColors.primary.withValues(
                                    alpha: .5,
                                  ),
                                ),
                              ),
                              child: Text(
                                steps[i].$1,
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: i == 0
                                      ? SiteColors.onPrimary
                                      : SiteColors.primary,
                                ),
                              ),
                            ),
                            if (i < steps.length - 1)
                              Container(
                                width: 1,
                                height: compact ? 65 : 75,
                                color: SiteColors.line,
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 1, bottom: 22),
                          child: compact
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      steps[i].$2,
                                      style: const TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w700,
                                        color: SiteColors.primary,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      steps[i].$3,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        height: 1.6,
                                        color: SiteColors.muted,
                                      ),
                                    ),
                                  ],
                                )
                              : Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 140,
                                      child: Text(
                                        steps[i].$2,
                                        style: const TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w700,
                                          color: SiteColors.primary,
                                          letterSpacing: 1.2,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        steps[i].$3,
                                        style: const TextStyle(
                                          fontSize: 13,
                                          height: 1.6,
                                          color: SiteColors.muted,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                      ),
                    ],
                  ),
              ],
            );
          },
        ),
      ],
    ),
  );
}
