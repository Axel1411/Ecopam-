import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../widgets/common_widgets.dart';
import '../../data/mock_data_store.dart';
import '../../models/report_model.dart';

class RiwayatPoinScreen extends StatefulWidget {
  const RiwayatPoinScreen({super.key});

  @override
  State<RiwayatPoinScreen> createState() => _RiwayatPoinScreenState();
}

class _RiwayatPoinScreenState extends State<RiwayatPoinScreen> {
  String _filter = 'Semua';

  @override
  Widget build(BuildContext context) {
    final reports = appStore.reports.where((r) {
      if (_filter == 'Semua') return true;
      if (_filter == 'Terverifikasi') return r.status == ReportStatus.terverifikasi;
      return r.status == ReportStatus.diproses || r.status == ReportStatus.menunggu;
    }).toList();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const ScreenHeader(title: 'Eco-Points', subtitle: 'Coba klik filter di bawah'),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                HeroStatCard(value: '${appStore.totalEcoPoints} pts', label: 'Total terkumpul bulan ini'),
                const SizedBox(height: 16),
                FilterChipRow(
                  options: const ['Semua', 'Terverifikasi', 'Diproses'],
                  selected: _filter,
                  onSelect: (v) => setState(() => _filter = v),
                ),
                const SizedBox(height: 16),
                ...reports.map((r) => ListRowCard(
                      dotColor: r.status.dotColor,
                      title: r.status == ReportStatus.terverifikasi ? '+${r.poin} pts' : 'Menunggu',
                      subtitle: '${r.lokasiLabel} · ${r.waktuLabel}',
                    )),
                if (reports.isEmpty)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    child: Center(
                        child: Text('Belum ada laporan di kategori ini', style: TextStyle(color: AppColors.textMuted))),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
