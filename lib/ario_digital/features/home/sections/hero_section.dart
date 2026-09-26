import 'package:flutter/material.dart';
import '../../../core/site_theme.dart';
import '../../../core/site_widgets.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
    required this.onExplore,
    required this.onContact,
  });
  final VoidCallback onExplore;
  final VoidCallback onContact;

  @override
  Widget build(BuildContext context) => SiteSection(
    padding: const EdgeInsets.only(top: 58, bottom: 56),
    child: LayoutBuilder(
      builder: (context, box) {
        final compact = box.maxWidth < 760;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Wrap(
              spacing: 24,
              runSpacing: 8,
              children: [
                Text(
                  'Ario Digital / Independent digital studio',
                  style: TextStyle(fontSize: 12, color: SiteColors.muted),
                ),
                Text(
                  'Website · Aplikasi · Identitas digital',
                  style: TextStyle(fontSize: 12, color: SiteColors.muted),
                ),
              ],
            ),
            const SizedBox(height: 48),
            Text(
              'Usaha yang baik,',
              style: TextStyle(
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w500,
                fontSize: compact ? 36 : 72,
                height: 1.15,
                letterSpacing: compact ? -1.5 : -3,
                color: SiteColors.text,
              ),
            ),
            Text(
              'layak tampil baik.',
              style: TextStyle(
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w400,
                fontSize: compact ? 36 : 72,
                height: 1.15,
                letterSpacing: compact ? -1.5 : -3,
                color: SiteColors.primary,
              ),
            ),
            const SizedBox(height: 34),
            LayoutBuilder(
              builder: (context, constraints) {
                final intro = Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Saya bantu merancang website dan aplikasi yang terasa pas untuk usahamu. Jelas kegunaannya, nyaman dipakai, dan punya karakter sendiri.',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.8,
                        color: SiteColors.muted,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        PrimaryAction(
                          label: 'Ceritakan Project-mu',
                          onPressed: onContact,
                        ),
                        TextButton(
                          onPressed: onExplore,
                          child: const Text(
                            'Kenali layanannya ↗',
                            style: TextStyle(color: SiteColors.text),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
                return compact
                    ? intro
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(
                            child: Text(
                              'Dikerjakan langsung.\nDibicarakan dengan jelas.',
                              style: TextStyle(
                                fontSize: 13,
                                height: 1.8,
                                color: SiteColors.muted,
                              ),
                            ),
                          ),
                          Expanded(flex: 2, child: intro),
                        ],
                      );
              },
            ),
            const SizedBox(height: 54),
            const Divider(height: 1),
            const SizedBox(height: 20),
            Wrap(
              spacing: 34,
              runSpacing: 18,
              children: const [
                _StudioNote('01', 'Mulai dari cerita usahamu'),
                _StudioNote('02', 'Rancang dengan tujuan'),
                _StudioNote('03', 'Bangun yang benar-benar berguna'),
              ],
            ),
          ],
        );
      },
    ),
  );
}

class _StudioNote extends StatelessWidget {
  const _StudioNote(this.number, this.label);
  final String number;
  final String label;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        number,
        style: const TextStyle(fontSize: 11, color: SiteColors.primary),
      ),
      const SizedBox(width: 10),
      Flexible(
        child: Text(
          label,
          style: const TextStyle(fontSize: 12, color: SiteColors.muted),
        ),
      ),
    ],
  );
}
