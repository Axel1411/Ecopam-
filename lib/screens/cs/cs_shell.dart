import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import 'dashboard_cs_screen.dart';
import 'antrean_cs_screen.dart';
import 'riwayat_selesai_screen.dart';
import 'profil_cs_screen.dart';

class CsShell extends StatefulWidget {
  const CsShell({super.key});

  @override
  State<CsShell> createState() => _CsShellState();
}

class _CsShellState extends State<CsShell> {
  int _index = 0;
  void _goTo(int index) => setState(() => _index = index);

  @override
  Widget build(BuildContext context) {
    final screens = [
      DashboardCsScreen(onBukaAntrean: () => _goTo(1)),
      const AntreanCsScreen(),
      const RiwayatSelesaiScreen(),
      const ProfilCsScreen(),
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
          BottomNavigationBarItem(icon: Icon(Icons.format_list_bulleted_outlined), label: 'Antrean'),
          BottomNavigationBarItem(icon: Icon(Icons.check_circle_outline), label: 'Selesai'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profil'),
        ],
      ),
    );
  }
}
