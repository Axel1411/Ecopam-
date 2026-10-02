import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import 'dashboard_sarpras_screen.dart';
import 'laporan_masuk_screen.dart';
import 'unit_sampah_screen.dart';
import 'profil_sarpras_screen.dart';

class SarprasShell extends StatefulWidget {
  const SarprasShell({super.key});

  @override
  State<SarprasShell> createState() => _SarprasShellState();
}

class _SarprasShellState extends State<SarprasShell> {
  int _index = 0;
  void _goTo(int index) => setState(() => _index = index);

  @override
  Widget build(BuildContext context) {
    const screens = [
      DashboardSarprasScreen(),
      LaporanMasukScreen(),
      UnitSampahScreen(),
      ProfilSarprasScreen(),
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
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart_outlined), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt_outlined), label: 'Laporan'),
          BottomNavigationBarItem(icon: Icon(Icons.delete_outline), label: 'Unit'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profil'),
        ],
      ),
    );
  }
}
