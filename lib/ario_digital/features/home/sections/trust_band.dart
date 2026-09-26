import 'package:flutter/material.dart';
import '../../../core/site_theme.dart';
import '../../../core/site_widgets.dart';

class TrustBand extends StatelessWidget {
  const TrustBand({super.key});
  @override
  Widget build(BuildContext context) => Container(
    color: SiteColors.backgroundAlt,
    padding: const EdgeInsets.symmetric(vertical: 22),
    child: SiteContainer(
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        runSpacing: 16,
        spacing: 24,
        children: const [
          _TrustItem(Icons.devices_rounded, 'Responsive by design'),
          _TrustItem(
            Icons.business_center_rounded,
            'Built around your business',
          ),
          _TrustItem(Icons.layers_rounded, 'Modern, maintainable systems'),
          _TrustItem(Icons.code_rounded, 'Web & mobile development'),
        ],
      ),
    ),
  );
}

class _TrustItem extends StatelessWidget {
  const _TrustItem(this.icon, this.label);
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(icon, color: SiteColors.primary, size: 17),
      const SizedBox(width: 9),
      Flexible(
        child: Text(
          label,
          style: const TextStyle(
            color: SiteColors.muted,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ],
  );
}
