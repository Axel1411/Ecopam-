import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../widgets/common_widgets.dart';
import '../../data/mock_data_store.dart';
import '../auth/login_screen.dart';

class ProfilSarprasScreen extends StatelessWidget {
  const ProfilSarprasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = appStore.timSarpras;
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
            Text(user.deskripsiTim ?? '', style: const TextStyle(color: AppColors.textMuted, fontSize: 13)),
            const SizedBox(height: 24),
            ProfileMenuTile(
              title: 'Ekspor Rekap',
              subtitle: 'Unduh laporan bulanan (.pdf/.xlsx)',
              onTap: () => ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Rekap bulanan diunduh (simulasi)'))),
            ),
            ProfileMenuTile(
              title: 'Kelola Akun',
              subtitle: 'Tambah anggota tim Sarpras',
              onTap: () => ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Fitur kelola akun (simulasi)'))),
            ),
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
