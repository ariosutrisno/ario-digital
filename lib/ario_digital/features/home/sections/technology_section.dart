import 'package:flutter/material.dart';
import '../../../core/site_theme.dart';
import '../../../core/site_widgets.dart';

class TechnologySection extends StatelessWidget {
  const TechnologySection({super.key});
  static const groups = [
    (
      'FRONTEND',
      ['HTML', 'CSS', 'JavaScript', 'Bootstrap', 'Flutter Web'],
      Icons.web_rounded,
    ),
    (
      'BACKEND',
      ['PHP', 'Laravel', 'REST API'],
      Icons.settings_ethernet_rounded,
    ),
    ('MOBILE', ['Flutter', 'Dart'], Icons.phone_android_rounded),
    ('DATABASE', ['MySQL', 'MariaDB', 'SQL'], Icons.storage_rounded),
    (
      'TOOLS',
      ['Git', 'GitHub', 'GitLab', 'Postman', 'DBeaver', 'Figma'],
      Icons.build_rounded,
    ),
  ];
  @override
  Widget build(BuildContext context) => SiteSection(
    background: true,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeading(
          kicker: 'TECH STACK',
          title: 'Teknologi dipilih sesuai masalah.',
          description:
              'Tools yang tepat membantu produk lebih mudah dipakai, dikembangkan, dan dirawat.',
        ),
        const SizedBox(height: 36),
        LayoutBuilder(
          builder: (context, box) {
            final width = box.maxWidth < 650 ? box.maxWidth : 350.0;
            return Wrap(
              spacing: 14,
              runSpacing: 14,
              children: [
                for (final group in groups)
                  SizedBox(
                    width: width,
                    child: SurfaceCard(
                      padding: const EdgeInsets.all(18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                group.$3,
                                color: SiteColors.primary,
                                size: 17,
                              ),
                              const SizedBox(width: 9),
                              Text(
                                group.$1,
                                style: const TextStyle(
                                  color: SiteColors.text,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 14),
                          Wrap(
                            spacing: 7,
                            runSpacing: 7,
                            children: [
                              for (final tech in group.$2)
                                Tag(tech, color: SiteColors.secondary),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    ),
  );
}
