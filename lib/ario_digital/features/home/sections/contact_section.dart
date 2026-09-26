import 'package:flutter/material.dart';
import '../../../core/app_links.dart';
import '../../../core/site_theme.dart';
import '../../../core/site_widgets.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});
  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  String? _projectType;
  String? _budget;
  static const projectTypes = [
    'Landing Page',
    'Company Profile',
    'Web Application',
    'Mobile Application',
    'Dashboard',
    'API Integration',
    'Existing System Improvement',
    'Other',
  ];
  static const budgets = [
    'Need consultation',
    'Under Rp 5 million',
    'Rp 5-10 million',
    'Rp 10-25 million',
    'Rp 25+ million',
  ];

  @override
  Widget build(BuildContext context) => SiteSection(
    id: 'contact',
    background: true,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeading(
          kicker: 'MULAI PROJECT',
          title: 'Ada ide yang ingin diwujudkan?',
          description:
              'Ceritakan apa yang ingin kamu bangun, perbaiki, atau sederhanakan. Kita cari solusi yang paling masuk akal untuk bisnismu.',
        ),
        const SizedBox(height: 34),
        LayoutBuilder(
          builder: (context, box) {
            final form = SurfaceCard(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Ceritakan kebutuhanmu',
                      style: TextStyle(
                        color: SiteColors.text,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _fields(
                      box.maxWidth < 800
                          ? box.maxWidth
                          : (box.maxWidth - 20) * .6,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: PrimaryAction(
                        label: 'Kirim ringkasan project',
                        icon: Icons.arrow_forward_rounded,
                        onPressed: _submit,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Demo UI: data hanya divalidasi di perangkat ini dan tidak dikirim ke server.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: SiteColors.muted, fontSize: 10),
                    ),
                  ],
                ),
              ),
            );
            final contact = SurfaceCard(
              color: SiteColors.backgroundAlt,
              padding: const EdgeInsets.all(26),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const IconBadge(Icons.chat_bubble_outline_rounded, size: 48),
                  const SizedBox(height: 19),
                  const Text(
                    'Ngobrol dulu juga boleh.',
                    style: TextStyle(
                      color: SiteColors.text,
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Punya pertanyaan singkat atau masih merapikan ide? Kita mulai dari obrolan santai.',
                    style: TextStyle(
                      color: SiteColors.muted,
                      fontSize: 13,
                      height: 1.7,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _ContactButton(
                    icon: Icons.chat_rounded,
                    label: 'WhatsApp',
                    onTap: () => _showContactInfo('WhatsApp'),
                  ),
                  const SizedBox(height: 10),
                  _ContactButton(
                    icon: Icons.mail_outline_rounded,
                    label: 'Email',
                    onTap: () => _showContactInfo('Email'),
                  ),
                  const SizedBox(height: 21),
                  const Divider(color: SiteColors.line),
                  const SizedBox(height: 15),
                  const Row(
                    children: [
                      Icon(
                        Icons.schedule_rounded,
                        size: 16,
                        color: SiteColors.primary,
                      ),
                      SizedBox(width: 9),
                      Expanded(
                        child: Text(
                          'Respons pada hari kerja',
                          style: TextStyle(
                            fontSize: 12,
                            color: SiteColors.muted,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
            return box.maxWidth < 800
                ? Column(children: [form, const SizedBox(height: 20), contact])
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 6, child: form),
                      const SizedBox(width: 20),
                      Expanded(flex: 4, child: contact),
                    ],
                  );
          },
        ),
      ],
    ),
  );

  Widget _fields(double width) {
    final twoColumns = width >= 650;
    InputDecoration decoration(String label, {String? hint}) => InputDecoration(
      labelText: label,
      hintText: hint,
      hintStyle: const TextStyle(color: SiteColors.muted, fontSize: 12),
      labelStyle: const TextStyle(color: SiteColors.muted, fontSize: 12),
      filled: true,
      fillColor: SiteColors.backgroundAlt,
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(11),
        borderSide: const BorderSide(color: SiteColors.line),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(11),
        borderSide: const BorderSide(color: SiteColors.line),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(11),
        borderSide: const BorderSide(color: SiteColors.primary, width: 1.3),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(11),
        borderSide: const BorderSide(color: Color(0xFFE98181)),
      ),
    );
    Widget field(
      String label, {
      String? hint,
      int maxLines = 1,
      TextInputType? keyboardType,
      String? Function(String?)? validator,
    }) => TextFormField(
      keyboardType: keyboardType,
      maxLines: maxLines,
      validator:
          validator ??
          (value) => value == null || value.trim().isEmpty
              ? 'Bagian ini perlu diisi'
              : null,
      style: const TextStyle(color: SiteColors.text, fontSize: 13),
      decoration: decoration(label, hint: hint),
    );
    Widget dropdown(
      String label,
      List<String> values,
      String? selected,
      ValueChanged<String?> onChanged,
    ) => DropdownButtonFormField<String>(
      initialValue: selected,
      isExpanded: true,
      validator: (value) => value == null ? 'Pilih salah satu' : null,
      dropdownColor: SiteColors.surface,
      style: const TextStyle(color: SiteColors.text, fontSize: 12),
      decoration: decoration(label),
      items: values
          .map(
            (value) => DropdownMenuItem(
              value: value,
              child: Text(value, overflow: TextOverflow.ellipsis),
            ),
          )
          .toList(),
      onChanged: onChanged,
    );
    Widget row(List<Widget> children) => twoColumns
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var i = 0; i < children.length; i++)
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: i == 0 ? 8 : 0,
                      left: i == 1 ? 8 : 0,
                    ),
                    child: children[i],
                  ),
                ),
            ],
          )
        : Column(
            children: [
              for (final child in children)
                Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: child,
                ),
            ],
          );
    return Column(
      children: [
        row([
          field('Nama lengkap', hint: 'Nama kamu'),
          field('Bisnis / perusahaan', hint: 'Nama bisnis'),
        ]),
        if (!twoColumns) const SizedBox(height: 2),
        row([
          field(
            'Email',
            hint: 'nama@email.com',
            keyboardType: TextInputType.emailAddress,
            validator: (value) => value == null || !value.contains('@')
                ? 'Masukkan email yang valid'
                : null,
          ),
          field(
            'Nomor WhatsApp',
            hint: '+62 ...',
            keyboardType: TextInputType.phone,
          ),
        ]),
        if (!twoColumns) const SizedBox(height: 2),
        row([
          dropdown(
            'Jenis project',
            projectTypes,
            _projectType,
            (value) => setState(() => _projectType = value),
          ),
          dropdown(
            'Estimasi budget',
            budgets,
            _budget,
            (value) => setState(() => _budget = value),
          ),
        ]),
        if (!twoColumns) const SizedBox(height: 2),
        field(
          'Ceritakan project-mu',
          hint: 'Apa yang ingin kamu bangun atau tingkatkan?',
          maxLines: 4,
        ),
      ],
    );
  }

  void _submit() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Form valid. Integrasi pengiriman bisa ditambahkan nanti.',
        ),
      ),
    );
  }

  void _showContactInfo(String channel) {
    final configured = channel == 'WhatsApp'
        ? AppLinks.whatsapp
        : AppLinks.email;
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('$channel ARIO DIGITAL'),
        content: Text(
          configured.isEmpty
              ? 'Kontak $channel belum diatur. Tambahkan detail kontak di konfigurasi AppLinks saat sudah siap.'
              : configured,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Tutup'),
          ),
        ],
      ),
    );
  }
}

class _ContactButton extends StatelessWidget {
  const _ContactButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) => SizedBox(
    width: double.infinity,
    child: OutlinedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 17),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        foregroundColor: SiteColors.text,
        side: const BorderSide(color: SiteColors.line),
        alignment: Alignment.centerLeft,
        minimumSize: const Size(48, 48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
      ),
    ),
  );
}
