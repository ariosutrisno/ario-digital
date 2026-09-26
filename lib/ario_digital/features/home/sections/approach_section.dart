import 'package:flutter/material.dart';
import '../../../core/site_theme.dart';
import '../../../core/site_widgets.dart';

class ApproachSection extends StatelessWidget {
  const ApproachSection({super.key});

  @override
  Widget build(BuildContext context) => SiteSection(
    background: true,
    child: LayoutBuilder(
      builder: (context, box) {
        const statement = SectionHeading(
          kicker: 'Kenalan sebentar',
          title: 'Kamu cerita.\nSaya bantu merancang.',
          description:
              'ARIO DIGITAL dikerjakan oleh Ario Sutrisno. Dari obrolan pertama sampai hasil akhirnya, kamu berkomunikasi langsung dengan orang yang mengerjakan project-mu.',
        );
        final principles = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (final item in const [
              (
                '01',
                'Dengarkan dulu',
                'Pahami usahanya, pelanggan, dan pekerjaan sehari-hari sebelum memilih solusi.',
              ),
              (
                '02',
                'Buat yang berguna',
                'Tampilan yang punya tujuan dan alur yang mudah dimengerti pelanggan.',
              ),
              (
                '03',
                'Bicarakan dengan jelas',
                'Lingkup, tahapan, dan perubahan didiskusikan supaya ekspektasi tetap sejalan.',
              ),
            ])
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Divider(),
                    const SizedBox(height: 12),
                    Text(
                      '${item.$1} / ${item.$2}',
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: SiteColors.text,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      item.$3,
                      style: const TextStyle(
                        fontSize: 14,
                        height: 1.8,
                        color: SiteColors.muted,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        );
        return box.maxWidth < 760
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [statement, const SizedBox(height: 32), principles],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(child: statement),
                  const SizedBox(width: 72),
                  Expanded(child: principles),
                ],
              );
      },
    ),
  );
}
