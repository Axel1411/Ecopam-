import 'package:flutter/material.dart';
import '../../widgets/common_widgets.dart';
import '../../data/mock_data_store.dart';
import '../../models/report_model.dart';

class BerandaMahasiswaScreen extends StatelessWidget {
  final VoidCallback onLapor;
  const BerandaMahasiswaScreen({super.key, required this.onLapor});

  @override
  Widget build(BuildContext context) {
    final terbaru = appStore.reports.take(2).toList();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ScreenHeader(
            title: 'Halo, ${appStore.mahasiswa.nama.split(' ').first} 👋',
            subtitle: 'Yuk jaga kampus tetap bersih',
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                HeroStatCard(
                  value: '${appStore.totalEcoPoints} pts',
                  label: 'Eco-Points kamu · ${appStore.laporanHariIni}/2 laporan hari ini',
                ),
                const SizedBox(height: 16),
                PrimaryButton(label: '+ Lapor Sampah', onPressed: onLapor),
                const SizedBox(height: 24),
                const SectionLabel('Laporan Terbaru'),
                ...terbaru.map((r) => ListRowCard(
                      dotColor: r.status.dotColor,
                      title: r.lokasiLabel,
                      subtitle:
                          r.status == ReportStatus.terverifikasi ? '${r.status.label} · +${r.poin} pts' : r.status.label,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
