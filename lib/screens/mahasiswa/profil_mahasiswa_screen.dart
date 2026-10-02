import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../widgets/common_widgets.dart';
import '../../data/mock_data_store.dart';
import '../auth/login_screen.dart';

class ProfilMahasiswaScreen extends StatelessWidget {
  const ProfilMahasiswaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = appStore.mahasiswa;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 12),
            ProfileAvatar(initials: user.initials),
            const SizedBox(height: 12),
            Text(user.nama, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 2),
            Text('${user.nim} · ${user.prodi}', style: const TextStyle(color: AppColors.textMuted, fontSize: 13)),
            const SizedBox(height: 24),
            ProfileMenuTile(
              title: '${appStore.totalEcoPoints} Eco-Points',
              subtitle: '${user.laporanTerverifikasi} laporan terverifikasi',
            ),
            ProfileMenuTile(title: 'Ubah Kata Sandi', subtitle: 'Keamanan akun', onTap: () {}),
            ProfileMenuTile(title: 'Pusat Bantuan', subtitle: 'FAQ & kontak Sarpras', onTap: () {}),
            const SizedBox(height: 12),
            OutlinedDangerButton(
              label: 'Keluar (Logout)',
              onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => const LoginScreen()),
                (route) => false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
