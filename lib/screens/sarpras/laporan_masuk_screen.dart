import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../widgets/common_widgets.dart';
import '../../data/mock_data_store.dart';

class LaporanMasukScreen extends StatelessWidget {
  const LaporanMasukScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const ScreenHeader(title: 'Laporan Masuk', subtitle: 'Feed mentah dari semua laporan mahasiswa'),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: appStore.laporanMasuk.map((l) {
                final dot = l.selesai ? AppColors.success : (l.jumlahLaporan > 1 ? AppColors.urgent : AppColors.warning);
                final title = l.titik != null ? '${l.lokasi}, ${l.titik}' : l.lokasi;
                final subtitle = l.selesai ? 'Selesai · ${l.waktuLabel}' : '${l.jumlahLaporan} laporan · ${l.waktuLabel}';
                return ListRowCard(dotColor: dot, title: title, subtitle: subtitle);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
