import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import 'beranda_mahasiswa_screen.dart';
import 'lapor_sampah_screen.dart';
import 'riwayat_poin_screen.dart';
import 'profil_mahasiswa_screen.dart';

class MahasiswaShell extends StatefulWidget {
  const MahasiswaShell({super.key});

  @override
  State<MahasiswaShell> createState() => _MahasiswaShellState();
}

class _MahasiswaShellState extends State<MahasiswaShell> {
  int _index = 0;
  void _goTo(int index) => setState(() => _index = index);

  @override
  Widget build(BuildContext context) {
    final screens = [
      BerandaMahasiswaScreen(onLapor: () => _goTo(1)),
      LaporSampahScreen(onDone: () => _goTo(0)),
      const RiwayatPoinScreen(),
      const ProfilMahasiswaScreen(),
    ];

    return Scaffold(
      body: SafeArea(child: screens[_index]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: _goTo,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textLight,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline), label: 'Lapor'),
          BottomNavigationBarItem(icon: Icon(Icons.star_outline), label: 'Poin'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profil'),
        ],
      ),
    );
  }
}
