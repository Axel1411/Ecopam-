import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

enum TaskStatus { mendesak, normal, ditangani }

extension TaskStatusX on TaskStatus {
  Color get dotColor {
    switch (this) {
      case TaskStatus.mendesak:
        return AppColors.urgent;
      case TaskStatus.normal:
        return AppColors.warning;
      case TaskStatus.ditangani:
        return AppColors.success;
    }
  }
}

class CsTaskModel {
  final String id;
  final String lokasi;
  final String? titik;
  final int laporanDigabung;
  final int autoCloseMenit;
  final TaskStatus status;

  CsTaskModel({
    required this.id,
    required this.lokasi,
    this.titik,
    required this.laporanDigabung,
    required this.autoCloseMenit,
    required this.status,
  });

  String get subtitle {
    if (status == TaskStatus.ditangani) {
      return 'Ditangani · menunggu auto-close';
    }
    final laporanText = laporanDigabung > 1 ? '$laporanDigabung laporan digabung' : '$laporanDigabung laporan';
    return '$laporanText · Auto-close $autoCloseMenit mnt';
  }
}

class SelesaiTaskModel {
  final String id;
  final String lokasi;
  final String? titik;
  final String waktuSelesaiLabel;

  SelesaiTaskModel({
    required this.id,
    required this.lokasi,
    this.titik,
    required this.waktuSelesaiLabel,
  });
}
