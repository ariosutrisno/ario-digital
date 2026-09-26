import 'package:flutter/material.dart';
import '../../../core/site_data.dart';
import '../../../core/site_theme.dart';
import '../../../core/site_widgets.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key, required this.onDemo});
  final ValueChanged<String> onDemo;

  @override
  Widget build(BuildContext context) => SiteSection(
    background: true,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeading(
          kicker: 'Catatan visual / 01—03',
          title: 'Seperti apa usahamu\nbisa terlihat?',
          description:
              'Tiga studi konsep untuk membayangkan hasilnya. Bukan klaim project pelanggan.',
        ),
        const SizedBox(height: 36),
        for (var i = 0; i < projects.length; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: 44),
            child: LayoutBuilder(
              builder: (context, box) {
                final project = projects[i];
                final preview = _ProjectPreview(index: i);
                final details = Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '0${i + 1} / Studi konsep',
                      style: const TextStyle(
                        fontSize: 12,
                        color: SiteColors.muted,
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      project.title,
                      style: const TextStyle(
                        fontFamily: 'Manrope',
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        color: SiteColors.text,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      project.description,
                      style: const TextStyle(
                        fontSize: 15,
                        height: 1.8,
                        color: SiteColors.muted,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () => onDemo(project.link),
                      child: const Text('Jelajahi konsep ↗'),
                    ),
                  ],
                );
                return box.maxWidth < 720
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          preview,
                          const SizedBox(height: 24),
                          details,
                        ],
                      )
                    : Row(
                        children: [
                          Expanded(flex: 3, child: preview),
                          const SizedBox(width: 48),
                          Expanded(flex: 2, child: details),
                        ],
                      );
              },
            ),
          ),
      ],
    ),
  );
}

class _ProjectPreview extends StatelessWidget {
  const _ProjectPreview({required this.index});
  final int index;

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: const EdgeInsets.all(24),
    decoration: BoxDecoration(
      color: [
        SiteColors.surface,
        SiteColors.accentSurface,
        SiteColors.cyanSurface,
      ][index],
      border: Border(
        top: BorderSide(
          color: [
            SiteColors.brandBlue,
            SiteColors.skyBlue,
            SiteColors.cyan,
          ][index],
          width: 4,
        ),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          [
            'RUANG RASA / DAPUR & CERITA',
            'NUSA KARYA / ARSITEKTUR',
            'KARSA / RUANG KERJA',
          ][index],
          style: const TextStyle(
            fontSize: 10,
            letterSpacing: 1,
            color: SiteColors.muted,
          ),
        ),
        const SizedBox(height: 26),
        const Divider(),
        const SizedBox(height: 28),
        Text(
          [
            'Rasa yang\nbikin pulang.',
            'Ruang untuk\nhidup lebih baik.',
            'Lebih tertata.\nLebih tenang.',
          ][index],
          style: const TextStyle(
            fontFamily: 'Manrope',
            fontSize: 30,
            height: 1.3,
            fontWeight: FontWeight.w500,
            color: SiteColors.text,
          ),
        ),
        const SizedBox(height: 26),
        Text(
          [
            'Dari dapur kami, untuk meja kamu.',
            'Dari sketsa pertama, sampai ruang yang terasa milikmu.',
            'Pesanan, catatan, dan laporan dalam satu tempat.',
          ][index],
          style: const TextStyle(
            fontSize: 12,
            height: 1.6,
            color: SiteColors.muted,
          ),
        ),
        const SizedBox(height: 28),
        const Divider(),
        Text(
          [
            'Menu musim ini →',
            'Lihat ruang pilihan →',
            'Ringkasan hari ini →',
          ][index],
          style: const TextStyle(fontSize: 12, color: SiteColors.primary),
        ),
      ],
    ),
  );
}
