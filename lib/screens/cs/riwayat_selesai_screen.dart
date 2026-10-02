import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../widgets/common_widgets.dart';
import '../../data/mock_data_store.dart';

class RiwayatSelesaiScreen extends StatelessWidget {
  const RiwayatSelesaiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const ScreenHeader(title: 'Riwayat Selesai', subtitle: 'Tugas yang sudah auto-close'),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: appStore.riwayatSelesai
                  .map((s) => ListRowCard(
                        dotColor: AppColors.success,
                        title: s.titik != null ? '${s.lokasi}, ${s.titik}' : s.lokasi,
                        subtitle: s.waktuSelesaiLabel,
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
