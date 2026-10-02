import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../widgets/common_widgets.dart';
import '../../data/mock_data_store.dart';

class AntreanCsScreen extends StatefulWidget {
  const AntreanCsScreen({super.key});

  @override
  State<AntreanCsScreen> createState() => _AntreanCsScreenState();
}

class _AntreanCsScreenState extends State<AntreanCsScreen> {
  void _showDetail(String taskId, String lokasi) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(lokasi, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Text(
              'Sistem akan auto-close tugas ini begitu waktunya habis. Kamu juga bisa menyelesaikannya lebih cepat.',
              style: TextStyle(color: AppColors.textMuted, fontSize: 13),
            ),
            const SizedBox(height: 20),
            PrimaryButton(
              label: 'Selesaikan Sekarang (Simulasi)',
              onPressed: () {
                setState(() => appStore.selesaikanTugas(taskId));
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tasks = [...appStore.csTasks]..sort((a, b) => a.autoCloseMenit.compareTo(b.autoCloseMenit));

    final List<Widget> taskWidgets = tasks.isEmpty
        ? [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 40),
              child: Center(child: Text('Antrean kosong 🎉', style: TextStyle(color: AppColors.textMuted))),
            ),
          ]
        : tasks
            .map<Widget>((t) => ListRowCard(
                  dotColor: t.status.dotColor,
                  title: t.titik != null ? '${t.lokasi} · ${t.titik}' : t.lokasi,
                  subtitle: t.subtitle,
                  onTap: () => _showDetail(t.id, t.titik != null ? '${t.lokasi} · ${t.titik}' : t.lokasi),
                ))
            .toList();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const ScreenHeader(title: 'Antrean Tugas', subtitle: 'Diurutkan dari paling mendesak'),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: taskWidgets),
          ),
        ],
      ),
    );
  }
}
