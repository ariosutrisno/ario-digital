import 'package:flutter/material.dart';

class ServiceItem {
  const ServiceItem(
    this.number,
    this.icon,
    this.title,
    this.description,
    this.tags,
  );
  final String number;
  final IconData icon;
  final String title;
  final String description;
  final List<String> tags;
}

const services = <ServiceItem>[
  ServiceItem(
    '01',
    Icons.web_rounded,
    'Landing page',
    'Halaman promosi yang fokus menjelaskan nilai bisnis dan mengubah kunjungan menjadi pertanyaan.',
    ['Flutter Web', 'Responsive', 'SEO-ready'],
  ),
  ServiceItem(
    '02',
    Icons.apartment_rounded,
    'Website perusahaan',
    'Profil digital yang rapi untuk memperkenalkan perusahaan, layanan, portofolio, dan tim.',
    ['Company profile', 'CMS-ready', 'Responsive'],
  ),
  ServiceItem(
    '03',
    Icons.dashboard_customize_rounded,
    'Aplikasi web',
    'Aplikasi khusus untuk merapikan alur kerja, pengelolaan data, dan proses operasional.',
    ['Web app', 'Workflow', 'Admin panel'],
  ),
  ServiceItem(
    '04',
    Icons.phone_iphone_rounded,
    'Aplikasi mobile',
    'Pengalaman aplikasi Android dan iOS yang dirancang sesuai kebutuhan pengguna bisnis.',
    ['Flutter', 'Android', 'iOS'],
  ),
  ServiceItem(
    '05',
    Icons.query_stats_rounded,
    'Dashboard bisnis',
    'Ringkasan informasi penting agar pemilik bisnis lebih mudah memantau aktivitas dan mengambil keputusan.',
    ['Reporting', 'Analytics', 'Data UI'],
  ),
  ServiceItem(
    '06',
    Icons.hub_rounded,
    'API & integrasi',
    'Menghubungkan aplikasi, layanan, dan data agar proses bisnis berjalan lebih praktis.',
    ['REST API', 'Integration', 'Automation'],
  ),
  ServiceItem(
    '07',
    Icons.storage_rounded,
    'Backend & database',
    'Fondasi sistem untuk data, autentikasi, hak akses, dan aturan bisnis.',
    ['Laravel', 'MySQL', 'Business logic'],
  ),
  ServiceItem(
    '08',
    Icons.handyman_rounded,
    'Maintenance',
    'Perbaikan bug dan peningkatan aplikasi yang sudah berjalan agar tetap relevan dan nyaman digunakan.',
    ['Bug fixes', 'UI updates', 'Optimization'],
  ),
];

class ProjectItem {
  const ProjectItem(
    this.number,
    this.category,
    this.title,
    this.description,
    this.technologies,
    this.icon,
    this.link,
  );
  final String number;
  final String category;
  final String title;
  final String description;
  final List<String> technologies;
  final IconData icon;
  final String link;
}

const projects = <ProjectItem>[
  ProjectItem(
    '01',
    'BUSINESS WEBSITE',
    'Ruang Rasa',
    'Konsep website restoran dengan menu, promo, jam operasional, lokasi, dan jalur reservasi yang jelas.',
    ['Flutter Web', 'Responsive UI'],
    Icons.restaurant_rounded,
    'restaurant',
  ),
  ProjectItem(
    '02',
    'CORPORATE WEBSITE',
    'Nusa Karya',
    'Konsep company profile untuk menampilkan layanan, proyek, kredibilitas, dan informasi kontak.',
    ['Flutter Web', 'Brand system'],
    Icons.domain_rounded,
    'company',
  ),
  ProjectItem(
    '03',
    'BUSINESS APPLICATION',
    'Karsa Dashboard',
    'Konsep dashboard untuk melihat ringkasan transaksi, operasional, pengguna, dan laporan bisnis.',
    ['Flutter', 'Dashboard UI'],
    Icons.monitor_heart_rounded,
    'dashboard',
  ),
];

class FaqItem {
  const FaqItem(this.question, this.answer);
  final String question;
  final String answer;
}

const faqs = <FaqItem>[
  FaqItem(
    'Berapa biaya pembuatan project?',
    'Biaya menyesuaikan lingkup, fitur, integrasi, platform, dan target waktu. Ceritakan kebutuhanmu untuk mendapat estimasi yang lebih relevan.',
  ),
  FaqItem(
    'Berapa lama proses pengembangan?',
    'Website sederhana biasanya lebih cepat. Aplikasi khusus perlu waktu untuk analisis, desain, pengembangan, pengujian, dan revisi.',
  ),
  FaqItem(
    'Bisa minta perubahan saat project berjalan?',
    'Bisa. Perubahan kita diskusikan berdasarkan kebutuhan, lingkup kerja, dan tahap pengembangan.',
  ),
  FaqItem(
    'Bisa bantu aplikasi yang sudah ada?',
    'Bisa. Aplikasi dapat ditinjau untuk perbaikan bug, pembaruan tampilan, peningkatan performa, dan penambahan fitur.',
  ),
  FaqItem(
    'Bisa membuat aplikasi Android dan iOS?',
    'Flutter dapat digunakan untuk membangun aplikasi lintas platform. Pendekatannya akan disesuaikan dengan kebutuhan project.',
  ),
  FaqItem(
    'Bisa menghubungkan API atau sistem yang sudah ada?',
    'Bisa. Integrasi ditentukan setelah meninjau dokumentasi API, autentikasi, alur data, dan kebutuhan keamanan.',
  ),
];
