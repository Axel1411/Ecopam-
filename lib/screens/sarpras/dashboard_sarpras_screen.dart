import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../widgets/common_widgets.dart';

class DashboardSarprasScreen extends StatefulWidget {
  const DashboardSarprasScreen({super.key});

  @override
  State<DashboardSarprasScreen> createState() => _DashboardSarprasScreenState();
}

class _DashboardSarprasScreenState extends State<DashboardSarprasScreen> {
  String _bulan = 'September';

  static const Map<String, Map<String, int>> _dataBulan = {
    'September': {'Prkr': 14, 'Gd A': 10, 'Gd B': 24, 'Gd C': 14},
    'Agustus': {'Prkr': 10, 'Gd A': 8, 'Gd B': 18, 'Gd C': 9},
  };

  @override
  Widget build(BuildContext context) {
    final data = _dataBulan[_bulan]!;
    final total = data.values.fold(0, (a, b) => a + b);
    final maxVal = data.values.reduce((a, b) => a > b ? a : b);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const ScreenHeader(title: 'Dashboard Sarpras', subtitle: 'Rekap bulanan titik terpadat'),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: _dataBulan.keys.map((b) {
                    final selected = b == _bulan;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ChoiceChip(
                        label: Text(b),
                        selected: selected,
                        onSelected: (_) => setState(() => _bulan = b),
                        selectedColor: AppColors.primary,
                        backgroundColor: AppColors.surfaceMuted,
                        labelStyle: TextStyle(
                          color: selected ? Colors.white : AppColors.textDark,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.cardBg,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.borderSubtle),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 120,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: data.entries.map((e) {
                            final height = (e.value / maxVal) * 100;
                            final isHighlight = e.key == 'Gd B';
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  width: 32,
                                  height: height,
                                  decoration: BoxDecoration(
                                    color: isHighlight ? AppColors.primary : AppColors.primaryLight,
                                    borderRadius: const BorderRadius.vertical(top: Radius.circular(6)),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(e.key, style: const TextStyle(fontSize: 11.5, fontWeight: FontWeight.w600)),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text('$total total', style: const TextStyle(color: AppColors.textMuted, fontSize: 12.5)),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const SectionLabel('Prioritas'),
                const ListRowCard(dotColor: AppColors.urgent, title: 'Gedung B', subtitle: 'Prioritas penambahan tempat sampah'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
