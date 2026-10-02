import 'package:flutter/material.dart';
import '../../widgets/common_widgets.dart';
import '../../data/mock_data_store.dart';

class UnitSampahScreen extends StatefulWidget {
  const UnitSampahScreen({super.key});

  @override
  State<UnitSampahScreen> createState() => _UnitSampahScreenState();
}

class _UnitSampahScreenState extends State<UnitSampahScreen> {
  void _ajukanUnitBaru() {
    final lokasiController = TextEditingController();
    final jumlahController = TextEditingController(text: '1');
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Ajukan Unit Baru'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: lokasiController, decoration: const InputDecoration(labelText: 'Lokasi')),
            TextField(
              controller: jumlahController,
              decoration: const InputDecoration(labelText: 'Jumlah unit'),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Batal')),
          TextButton(
            onPressed: () {
              if (lokasiController.text.trim().isEmpty) return;
              setState(() {
                appStore.ajukanUnitBaru(lokasiController.text.trim(), int.tryParse(jumlahController.text) ?? 1);
              });
              Navigator.of(context).pop();
            },
            child: const Text('Ajukan'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const ScreenHeader(title: 'Unit Tempat Sampah', subtitle: 'Status unit fisik terpasang'),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ...appStore.trashUnits.map((u) => ListRowCard(
                      dotColor: u.status.dotColor,
                      title: u.lokasi,
                      subtitle: '${u.jumlahUnit} unit · ${u.status.label}',
                    )),
                const SizedBox(height: 8),
                OutlinedPrimaryButton(label: '+ Ajukan Unit Baru', onPressed: _ajukanUnitBaru),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
