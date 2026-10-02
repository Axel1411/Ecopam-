import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../widgets/common_widgets.dart';
import '../../data/mock_data_store.dart';
import '../../models/cs_task_model.dart';

class DashboardCsScreen extends StatelessWidget {
  final VoidCallback onBukaAntrean;
  const DashboardCsScreen({super.key, required this.onBukaAntrean});

  @override
  Widget build(BuildContext context) {
    final mendesak = appStore.csTasks.where((t) => t.status == TaskStatus.mendesak).length;
    final selesaiHariIni = appStore.riwayatSelesai.length;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ScreenHeader(title: 'Halo, ${appStore.petugasCs.nama.split(' ').first} 👋', subtitle: 'Ringkasan tugas hari ini'),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                HeroStatCard(value: '$mendesak Mendesak', label: 'Perlu ditangani sebelum auto-close'),
                const SizedBox(height: 24),
                const SectionLabel('Ringkasan Hari Ini'),
                ListRowCard(dotColor: AppColors.urgent, title: '$mendesak Tugas Mendesak', subtitle: 'Auto-close di bawah 1 jam'),
                ListRowCard(dotColor: AppColors.success, title: '$selesaiHariIni Tugas Selesai', subtitle: 'Auto-close otomatis hari ini'),
                const SizedBox(height: 8),
                PrimaryButton(label: 'Buka Antrean', onPressed: onBukaAntrean),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
