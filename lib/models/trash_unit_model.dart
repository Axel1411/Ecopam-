import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

enum UnitStatus { seringPenuh, kapasitasKurang, mencukupi }

extension UnitStatusX on UnitStatus {
  Color get dotColor {
    switch (this) {
      case UnitStatus.seringPenuh:
        return AppColors.urgent;
      case UnitStatus.kapasitasKurang:
        return AppColors.warning;
      case UnitStatus.mencukupi:
        return AppColors.success;
    }
  }

  String get label {
    switch (this) {
      case UnitStatus.seringPenuh:
        return 'sering penuh';
      case UnitStatus.kapasitasKurang:
        return 'kapasitas kurang';
      case UnitStatus.mencukupi:
        return 'mencukupi';
    }
  }
}

class TrashUnitModel {
  final String id;
  final String lokasi;
  final int jumlahUnit;
  final UnitStatus status;

  TrashUnitModel({
    required this.id,
    required this.lokasi,
    required this.jumlahUnit,
    required this.status,
  });
}

class LaporanMasukModel {
  final String id;
  final String lokasi;
  final String? titik;
  final int jumlahLaporan;
  final String waktuLabel;
  final bool selesai;

  LaporanMasukModel({
    required this.id,
    required this.lokasi,
    this.titik,
    required this.jumlahLaporan,
    required this.waktuLabel,
    required this.selesai,
  });
}
