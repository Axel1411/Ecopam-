import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../widgets/common_widgets.dart';
import '../../data/mock_data_store.dart';
import 'konfirmasi_terkirim_screen.dart';

class LaporSampahScreen extends StatefulWidget {
  final VoidCallback onDone;
  const LaporSampahScreen({super.key, required this.onDone});

  @override
  State<LaporSampahScreen> createState() => _LaporSampahScreenState();
}

class _LaporSampahScreenState extends State<LaporSampahScreen> {
  static const _areaOptions = ['Parkiran Motor', 'Gedung A', 'Gedung B', 'Gedung C'];
  static const _lantaiOptions = ['Lantai 1', 'Lantai 2', 'Lantai 3', 'Lantai 4', 'Lobi'];
  static const _titikOptions = ['Dekat tangga', 'Depan kelas', 'Depan 201', 'Titik A', 'Titik B', 'Titik C'];

  String? _area;
  String? _lantai;
  String? _titik;
  bool _fotoDipilih = false;
  String? _error;

  void _submit() {
    if (_area == null || _lantai == null || _titik == null) {
      setState(() => _error = 'Lengkapi area, lantai, dan titik spesifik dulu ya');
      return;
    }
    if (!_fotoDipilih) {
      setState(() => _error = 'Tambahkan foto bukti dulu ya');
      return;
    }
    appStore.addReport(area: _area!, lantai: _lantai!, titikSpesifik: _titik!, adaFoto: true);
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => KonfirmasiTerkirimScreen(onBackToHome: widget.onDone)),
    );
  }

  Widget _dropdown(String label, String hint, List<String> options, String? value, ValueChanged<String?> onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 6),
          DropdownButtonFormField<String>(
            initialValue: value,
            hint: Text(hint),
            items: options.map((o) => DropdownMenuItem(value: o, child: Text(o))).toList(),
            onChanged: onChanged,
            decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
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
          const ScreenHeader(title: 'Lapor Titik Sampah', subtitle: 'Tanpa GPS, tinggal pilih lokasi'),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _dropdown('1. Area', 'Pilih area...', _areaOptions, _area, (v) => setState(() => _area = v)),
                _dropdown('2. Lantai', 'Pilih lantai...', _lantaiOptions, _lantai, (v) => setState(() => _lantai = v)),
                _dropdown('3. Titik Spesifik', 'Pilih titik...', _titikOptions, _titik, (v) => setState(() => _titik = v)),
                const Text('Foto Bukti', style: TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 6),
                InkWell(
                  onTap: () => setState(() => _fotoDipilih = !_fotoDipilih),
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 56,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.borderLight),
                      borderRadius: BorderRadius.circular(10),
                      color: _fotoDipilih ? AppColors.successBg : AppColors.surfaceMuted,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(_fotoDipilih ? Icons.check_circle : Icons.camera_alt_outlined,
                            color: _fotoDipilih ? AppColors.success : AppColors.textMuted, size: 20),
                        const SizedBox(width: 8),
                        Text(_fotoDipilih ? 'Foto terpilih' : 'Ambil / unggah foto',
                            style: TextStyle(color: _fotoDipilih ? AppColors.success : AppColors.textMuted)),
                      ],
                    ),
                  ),
                ),
                if (_error != null) ...[
                  const SizedBox(height: 8),
                  Text(_error!, style: const TextStyle(color: AppColors.urgent, fontSize: 12.5)),
                ],
                const SizedBox(height: 20),
                PrimaryButton(label: 'Kirim Laporan', onPressed: _submit),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
