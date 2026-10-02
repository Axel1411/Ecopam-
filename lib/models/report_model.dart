import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

enum ReportStatus { menunggu, diproses, terverifikasi }

extension ReportStatusX on ReportStatus {
  String get label {
    switch (this) {
      case ReportStatus.menunggu:
        return 'Menunggu';
      case ReportStatus.diproses:
        return 'Diproses CS';
      case ReportStatus.terverifikasi:
        return 'Selesai';
    }
  }

  Color get dotColor {
    switch (this) {
      case ReportStatus.menunggu:
        return AppColors.warning;
      case ReportStatus.diproses:
        return AppColors.warning;
      case ReportStatus.terverifikasi:
        return AppColors.success;
    }
  }
}

class ReportModel {
  final String id;
  final String area;
  final String lantai;
  final String titikSpesifik;
  final String lokasiLabel;
  final bool adaFoto;
  final ReportStatus status;
  final int poin;
  final DateTime waktu;
  final String mahasiswaId;
  final String mahasiswaNama;

  ReportModel({
    required this.id,
    required this.area,
    required this.lantai,
    required this.titikSpesifik,
    required this.lokasiLabel,
    required this.adaFoto,
    required this.status,
    required this.poin,
    required this.waktu,
    required this.mahasiswaId,
    required this.mahasiswaNama,
  });

  String get waktuLabel {
    final now = DateTime.now();
    final isToday = now.year == waktu.year && now.month == waktu.month && now.day == waktu.day;
    final yesterday = now.subtract(const Duration(days: 1));
    final isYesterday =
        yesterday.year == waktu.year && yesterday.month == waktu.month && yesterday.day == waktu.day;
    if (isToday) return 'Hari ini';
    if (isYesterday) return 'Kemarin';
    return '${waktu.day}/${waktu.month}/${waktu.year}';
  }
}
