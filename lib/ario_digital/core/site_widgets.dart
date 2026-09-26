import 'package:flutter/material.dart';

import 'site_theme.dart';

class SiteContainer extends StatelessWidget {
  const SiteContainer({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: 28),
  });
  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) => Center(
    child: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1200),
      child: Padding(padding: padding, child: child),
    ),
  );
}

class SiteSection extends StatelessWidget {
  const SiteSection({
    super.key,
    required this.child,
    this.id,
    this.background = false,
    this.padding = const EdgeInsets.symmetric(vertical: 96),
  });
  final Widget child;
  final String? id;
  final bool background;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) => Container(
    key: id == null ? null : ValueKey(id),
    color: background ? SiteColors.backgroundAlt : null,
    padding: padding,
    child: SiteContainer(child: child),
  );
}

class SectionHeading extends StatelessWidget {
  const SectionHeading({
    super.key,
    required this.kicker,
    required this.title,
    this.description,
    this.center = false,
  });
  final String kicker;
  final String title;
  final String? description;
  final bool center;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final titleStyle = Theme.of(context).textTheme.headlineMedium?.copyWith(
      fontSize: width < 600 ? 30 : 40,
      height: 1.17,
      letterSpacing: -1.3,
    );
    return Column(
      crossAxisAlignment: center
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          kicker.substring(0, 1).toUpperCase() +
              kicker.substring(1).toLowerCase(),
          textAlign: center ? TextAlign.center : null,
          style: const TextStyle(
            color: SiteColors.primary,
            fontSize: 13,
            fontWeight: FontWeight.w700,
            letterSpacing: .3,
          ),
        ),
        const SizedBox(height: 16),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 760),
          child: Text(
            title,
            textAlign: center ? TextAlign.center : null,
            style: titleStyle,
          ),
        ),
        if (description != null) ...[
          const SizedBox(height: 16),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 650),
            child: Text(
              description!,
              textAlign: center ? TextAlign.center : null,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ],
    );
  }
}

class PrimaryAction extends StatelessWidget {
  const PrimaryAction({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon = Icons.arrow_forward_rounded,
  });
  final String label;
  final VoidCallback onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) => FilledButton.icon(
    onPressed: onPressed,
    icon: Icon(icon, size: 18),
    label: Text(label),
    style: FilledButton.styleFrom(
      foregroundColor: SiteColors.onPrimary,
      backgroundColor: SiteColors.primary,
      minimumSize: const Size(48, 52),
      padding: const EdgeInsets.symmetric(horizontal: 22),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      textStyle: const TextStyle(fontWeight: FontWeight.w700),
    ),
  );
}

class OutlineAction extends StatelessWidget {
  const OutlineAction({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
  });
  final String label;
  final VoidCallback onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) => OutlinedButton.icon(
    onPressed: onPressed,
    icon: icon == null ? const SizedBox.shrink() : Icon(icon, size: 18),
    label: Text(label),
    style: OutlinedButton.styleFrom(
      foregroundColor: SiteColors.text,
      side: const BorderSide(color: SiteColors.line),
      minimumSize: const Size(48, 52),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
    ),
  );
}

class SurfaceCard extends StatelessWidget {
  const SurfaceCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(24),
    this.color = SiteColors.surface,
  });
  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
    padding: padding,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: SiteColors.line),
    ),
    child: child,
  );
}

class Tag extends StatelessWidget {
  const Tag(
    this.label, {
    super.key,
    this.color = SiteColors.primary,
    this.backgroundColor,
  });
  final String label;
  final Color color;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    decoration: BoxDecoration(
      color: backgroundColor ?? color.withValues(alpha: .09),
      borderRadius: BorderRadius.circular(30),
      border: Border.all(color: color.withValues(alpha: .19)),
    ),
    child: Text(
      label,
      style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: color),
    ),
  );
}

class ResponsiveGrid extends StatelessWidget {
  const ResponsiveGrid({
    super.key,
    required this.children,
    this.columns = 3,
    this.spacing = 16,
    this.runSpacing = 16,
    this.minTileWidth = 260,
  });
  final List<Widget> children;
  final int columns;
  final double spacing;
  final double runSpacing;
  final double minTileWidth;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, box) {
      final count = ((box.maxWidth + spacing) / (minTileWidth + spacing))
          .floor()
          .clamp(1, columns);
      final width = (box.maxWidth - spacing * (count - 1)) / count;
      return Column(
        children: [
          for (var start = 0; start < children.length; start += count)
            Padding(
              padding: EdgeInsets.only(top: start == 0 ? 0 : runSpacing),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for (
                      var i = start;
                      i < start + count && i < children.length;
                      i++
                    ) ...[
                      if (i > start) SizedBox(width: spacing),
                      SizedBox(width: width, child: children[i]),
                    ],
                  ],
                ),
              ),
            ),
        ],
      );
    },
  );
}

class IconBadge extends StatelessWidget {
  const IconBadge(
    this.icon, {
    super.key,
    this.color = SiteColors.primary,
    this.size = 46,
  });
  final IconData icon;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) => Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      color: color.withValues(alpha: .1),
      borderRadius: BorderRadius.circular(14),
    ),
    child: Icon(icon, color: color, size: size * .5),
  );
}
