import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../widgets/common_widgets.dart';

class KonfirmasiTerkirimScreen extends StatelessWidget {
  final VoidCallback onBackToHome;
  const KonfirmasiTerkirimScreen({super.key, required this.onBackToHome});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 84,
                height: 84,
                decoration: const BoxDecoration(color: AppColors.successBg, shape: BoxShape.circle),
                child: const Icon(Icons.check, color: AppColors.success, size: 42),
              ),
              const SizedBox(height: 20),
              const Text('Laporan Terkirim!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text('Tim CS akan menangani dalam 45–60 menit',
                  textAlign: TextAlign.center, style: TextStyle(color: AppColors.textMuted)),
              const SizedBox(height: 24),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(color: AppColors.accentOrangeCard, borderRadius: BorderRadius.circular(16)),
                child: const Column(
                  children: [
                    Text('+10 pts', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text('Menunggu verifikasi otomatis', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              const SizedBox(height: 28),
              PrimaryButton(
                label: 'Kembali ke Beranda',
                onPressed: () {
                  Navigator.of(context).pop();
                  onBackToHome();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
