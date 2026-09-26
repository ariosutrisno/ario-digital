import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/app_links.dart';
import '../../core/site_theme.dart';
import '../../core/site_widgets.dart';
import 'sections/sections.dart';

class BusinessPage extends StatefulWidget {
  const BusinessPage({super.key});

  @override
  State<BusinessPage> createState() => _BusinessPageState();
}

class _BusinessPageState extends State<BusinessPage> {
  final _sectionKeys = {
    for (final id in [
      'home',
      'services',
      'projects',
      'pricing',
      'process',
      'faq',
      'contact',
    ])
      id: GlobalKey(),
  };

  void _navigate(String id) {
    final target = _sectionKeys[id]?.currentContext;
    if (target != null) {
      Scrollable.ensureVisible(
        target,
        duration: const Duration(milliseconds: 520),
        curve: Curves.easeInOutCubic,
        alignment: 0.02,
      );
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Column(
      children: [
        _NavigationBar(onNavigate: _navigate, onDeveloper: _openPortfolio),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                KeyedSubtree(
                  key: _sectionKeys['home'],
                  child: HeroSection(
                    onExplore: () => _navigate('services'),
                    onContact: () => _navigate('contact'),
                  ),
                ),
                KeyedSubtree(
                  key: _sectionKeys['projects'],
                  child: ProjectsSection(onDemo: _showDemoStatus),
                ),
                KeyedSubtree(
                  key: _sectionKeys['services'],
                  child: ServicesSection(onContact: () => _navigate('contact')),
                ),
                const ApproachSection(),
                KeyedSubtree(
                  key: _sectionKeys['pricing'],
                  child: PricingSection(onContact: () => _navigate('contact')),
                ),
                KeyedSubtree(
                  key: _sectionKeys['process'],
                  child: const ProcessSection(),
                ),
                const SiteContainer(
                  child: ExpansionTile(
                    title: Text(
                      'Di balik pengerjaan: teknologi yang digunakan',
                    ),
                    children: [TechnologySection()],
                  ),
                ),
                KeyedSubtree(
                  key: _sectionKeys['faq'],
                  child: const FaqSection(),
                ),
                KeyedSubtree(
                  key: _sectionKeys['contact'],
                  child: const ContactSection(),
                ),
                SiteFooter(onNavigate: _navigate, onDeveloper: _openPortfolio),
              ],
            ),
          ),
        ),
      ],
    ),
  );

  void _showDemoStatus(String id) {
    final uri = switch (id) {
      'restaurant' => AppLinks.restaurantDemo,
      'company' => AppLinks.companyDemo,
      _ => AppLinks.dashboardDemo,
    };
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          uri.isEmpty
              ? 'Link demo akan ditambahkan setelah project demo siap.'
              : 'Demo tersedia di $uri',
        ),
      ),
    );
  }

  void _openPortfolio() => showDialog<void>(
    context: context,
    builder: (dialogContext) => AlertDialog(
      title: const Text('About the Developer'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'ARIO DIGITAL adalah layanan bisnis. Portfolio developer tersedia di:',
          ),
          const SizedBox(height: 12),
          SelectableText(AppLinks.portfolio),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(dialogContext),
          child: const Text('Tutup'),
        ),
        TextButton(
          onPressed: () async {
            await Clipboard.setData(
              const ClipboardData(text: AppLinks.portfolio),
            );
            if (!mounted || !dialogContext.mounted) return;
            Navigator.pop(dialogContext);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Link portfolio disalin.')),
            );
          },
          child: const Text('Salin link'),
        ),
      ],
    ),
  );
}

class _NavigationBar extends StatelessWidget {
  const _NavigationBar({required this.onNavigate, required this.onDeveloper});
  final ValueChanged<String> onNavigate;
  final VoidCallback onDeveloper;
  static const links = [
    ('Home', 'home'),
    ('Layanan', 'services'),
    ('Project', 'projects'),
    ('Harga', 'pricing'),
    ('Proses', 'process'),
    ('FAQ', 'faq'),
  ];

  @override
  Widget build(BuildContext context) => Material(
    color: SiteColors.background.withValues(alpha: .97),
    child: Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: SiteColors.line)),
      ),
      child: SiteContainer(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SizedBox(
          height: 76,
          child: LayoutBuilder(
            builder: (context, box) {
              final compact = box.maxWidth < 960;
              return Row(
                children: [
                  InkWell(
                    onTap: () => onNavigate('home'),
                    borderRadius: BorderRadius.circular(10),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 3),
                      child: Row(
                        children: [
                          Icon(
                            Icons.blur_on_rounded,
                            color: SiteColors.primary,
                            size: 27,
                          ),
                          SizedBox(width: 7),
                          Text(
                            'ARIO',
                            style: TextStyle(
                              fontFamily: 'Manrope',
                              fontSize: 18,
                              letterSpacing: 1.7,
                              fontWeight: FontWeight.w800,
                              color: SiteColors.text,
                            ),
                          ),
                          SizedBox(width: 6),
                          Text(
                            'DIGITAL',
                            style: TextStyle(
                              fontSize: 9,
                              letterSpacing: 1.4,
                              fontWeight: FontWeight.w700,
                              color: SiteColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  if (!compact) ...[
                    for (final item in links)
                      TextButton(
                        onPressed: () => onNavigate(item.$2),
                        child: Text(
                          item.$1,
                          style: const TextStyle(
                            color: SiteColors.muted,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    const SizedBox(width: 8),
                    PrimaryAction(
                      label: 'Konsultasi',
                      onPressed: () => onNavigate('contact'),
                    ),
                  ] else
                    IconButton(
                      tooltip: 'Buka navigasi',
                      onPressed: () => _showMenu(context),
                      icon: const Icon(
                        Icons.menu_rounded,
                        color: SiteColors.text,
                        size: 25,
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    ),
  );

  void _showMenu(BuildContext context) => showModalBottomSheet<void>(
    context: context,
    backgroundColor: SiteColors.surface,
    showDragHandle: true,
    builder: (context) => SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 22),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final item in [...links, ('Kontak', 'contact')])
              ListTile(
                minTileHeight: 50,
                leading: Icon(
                  _icon(item.$2),
                  color: SiteColors.primary,
                  size: 19,
                ),
                title: Text(
                  item.$1,
                  style: const TextStyle(color: SiteColors.text, fontSize: 14),
                ),
                onTap: () {
                  Navigator.pop(context);
                  onNavigate(item.$2);
                },
              ),
            const Divider(color: SiteColors.line),
            ListTile(
              leading: const Icon(
                Icons.person_outline_rounded,
                color: SiteColors.muted,
              ),
              title: const Text(
                'About the Developer',
                style: TextStyle(color: SiteColors.muted, fontSize: 13),
              ),
              onTap: () {
                Navigator.pop(context);
                onDeveloper();
              },
            ),
          ],
        ),
      ),
    ),
  );

  IconData _icon(String id) => switch (id) {
    'home' => Icons.home_outlined,
    'services' => Icons.grid_view_rounded,
    'projects' => Icons.work_outline_rounded,
    'pricing' => Icons.sell_outlined,
    'process' => Icons.route_outlined,
    'faq' => Icons.help_outline_rounded,
    _ => Icons.chat_bubble_outline_rounded,
  };
}
