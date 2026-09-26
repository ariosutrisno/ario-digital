import 'package:flutter/material.dart';
import '../../../core/site_data.dart';
import '../../../core/site_theme.dart';
import '../../../core/site_widgets.dart';

class FaqSection extends StatelessWidget {
  const FaqSection({super.key});
  @override
  Widget build(BuildContext context) => SiteSection(
    id: 'faq',
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeading(
          kicker: 'FAQ',
          title: 'Pertanyaan yang sering muncul.',
          description:
              'Belum yakin mulai dari mana? Berikut beberapa jawaban yang mungkin membantu.',
        ),
        const SizedBox(height: 30),
        ...faqs.map(
          (item) => Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              tilePadding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 2,
              ),
              childrenPadding: const EdgeInsets.fromLTRB(18, 0, 18, 17),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
                side: const BorderSide(color: SiteColors.line),
              ),
              collapsedShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
                side: const BorderSide(color: SiteColors.line),
              ),
              backgroundColor: SiteColors.surface,
              collapsedBackgroundColor: SiteColors.surface,
              iconColor: SiteColors.primary,
              collapsedIconColor: SiteColors.muted,
              title: Text(
                item.question,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: SiteColors.text,
                ),
              ),
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    item.answer,
                    style: const TextStyle(
                      fontSize: 13,
                      height: 1.7,
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
  );
}
