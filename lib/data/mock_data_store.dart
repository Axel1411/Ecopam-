import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../models/report_model.dart';
import '../models/cs_task_model.dart';
import '../models/trash_unit_model.dart';

/// In-memory mock "backend" for EcoPam.
/// No server involved — all data lives here for the session so every screen
/// (Lapor Sampah, Eco-Points filter, Antrean CS, Unit Sampah, etc.) is
/// actually functional, not just static UI.
class MockDataStore {
  MockDataStore._internal();
  static final MockDataStore instance = MockDataStore._internal();

  final UserModel mahasiswa = const UserModel(
    id: 'M1',
    nama: 'Queen Nu Ray',
    email: 'queen@unpam.ac.id',
    role: UserRole.mahasiswa,
    nim: '241011700515',
    prodi: 'Sistem Informasi',
    laporanTerverifikasi: 12,
  );

  final UserModel petugasCs = const UserModel(
    id: 'CS1',
    nama: 'Budi Santoso',
    email: 'budi@unpam.ac.id',
    role: UserRole.cs,
    shift: 'Shift Pagi',
    areaTugas: 'Parkiran & Gedung A–C',
    tugasSelesaiBulanIni: 18,
  );

  final UserModel timSarpras = const UserModel(
    id: 'SP1',
    nama: 'Tim Sarpras',
    email: 'sarpras@unpam.ac.id',
    role: UserRole.sarpras,
    deskripsiTim: 'Sarana & Prasarana Kampus',
  );

  final List<ReportModel> reports = [
    ReportModel(
      id: 'R1',
      area: 'Parkiran Motor',
      lantai: 'Lantai 4',
      titikSpesifik: 'Dekat tangga',
      lokasiLabel: 'Parkiran Lt. 4',
      adaFoto: true,
      status: ReportStatus.terverifikasi,
      poin: 10,
      waktu: DateTime.now(),
      mahasiswaId: 'M1',
      mahasiswaNama: 'Queen Nu Ray',
    ),
    ReportModel(
      id: 'R2',
      area: 'Gedung B',
      lantai: 'Lantai 1',
      titikSpesifik: 'Depan 201',
      lokasiLabel: 'Gedung B, Depan 201',
      adaFoto: true,
      status: ReportStatus.diproses,
      poin: 10,
      waktu: DateTime.now(),
      mahasiswaId: 'M1',
      mahasiswaNama: 'Queen Nu Ray',
    ),
    ReportModel(
      id: 'R3',
      area: 'Gedung A',
      lantai: 'Lobi',
      titikSpesifik: 'Dekat resepsionis',
      lokasiLabel: 'Gedung A, Lobi',
      adaFoto: true,
      status: ReportStatus.terverifikasi,
      poin: 10,
      waktu: DateTime.now().subtract(const Duration(days: 1)),
      mahasiswaId: 'M1',
      mahasiswaNama: 'Queen Nu Ray',
    ),
    ReportModel(
      id: 'R4',
      area: 'Parkiran Motor',
      lantai: 'Lantai 2',
      titikSpesifik: 'Titik A',
      lokasiLabel: 'Parkiran Lt. 2',
      adaFoto: false,
      status: ReportStatus.menunggu,
      poin: 10,
      waktu: DateTime.now(),
      mahasiswaId: 'M1',
      mahasiswaNama: 'Queen Nu Ray',
    ),
  ];

  final List<CsTaskModel> csTasks = [
    CsTaskModel(id: 'T1', lokasi: 'Parkiran Lt. 4', titik: 'Titik B', laporanDigabung: 3, autoCloseMenit: 52, status: TaskStatus.mendesak),
    CsTaskModel(id: 'T2', lokasi: 'Gedung C, Depan 305', laporanDigabung: 2, autoCloseMenit: 40, status: TaskStatus.mendesak),
    CsTaskModel(id: 'T3', lokasi: 'Parkiran Lt. 2', titik: 'Titik A', laporanDigabung: 1, autoCloseMenit: 58, status: TaskStatus.normal),
    CsTaskModel(id: 'T4', lokasi: 'Gedung A, Lobi', laporanDigabung: 1, autoCloseMenit: 0, status: TaskStatus.ditangani),
  ];

  final List<SelesaiTaskModel> riwayatSelesai = [
    SelesaiTaskModel(id: 'S1', lokasi: 'Gedung A, Lobi', waktuSelesaiLabel: 'Selesai 08:40 · Auto-close otomatis'),
    SelesaiTaskModel(id: 'S2', lokasi: 'Parkiran Lt. 1', titik: 'Titik C', waktuSelesaiLabel: 'Selesai 07:55 · Auto-close otomatis'),
    SelesaiTaskModel(id: 'S3', lokasi: 'Gedung C, Depan 210', waktuSelesaiLabel: 'Selesai Kemarin · Auto-close otomatis'),
    SelesaiTaskModel(id: 'S4', lokasi: 'Parkiran Lt. 3', titik: 'Titik A', waktuSelesaiLabel: 'Selesai Kemarin · Auto-close otomatis'),
  ];

  final List<LaporanMasukModel> laporanMasuk = [
    LaporanMasukModel(id: 'LM1', lokasi: 'Parkiran Lt. 4', titik: 'Titik B', jumlahLaporan: 3, waktuLabel: '09:12', selesai: false),
    LaporanMasukModel(id: 'LM2', lokasi: 'Gedung B, Depan 201', jumlahLaporan: 1, waktuLabel: '08:47', selesai: false),
    LaporanMasukModel(id: 'LM3', lokasi: 'Gedung A, Lobi', jumlahLaporan: 1, waktuLabel: '08:10', selesai: true),
    LaporanMasukModel(id: 'LM4', lokasi: 'Parkiran Lt. 1, Titik C', jumlahLaporan: 1, waktuLabel: '07:55', selesai: true),
  ];

  final List<TrashUnitModel> trashUnits = [
    TrashUnitModel(id: 'U1', lokasi: 'Parkiran Lt. 4', jumlahUnit: 2, status: UnitStatus.seringPenuh),
    TrashUnitModel(id: 'U2', lokasi: 'Gedung B, Depan Kelas', jumlahUnit: 3, status: UnitStatus.kapasitasKurang),
    TrashUnitModel(id: 'U3', lokasi: 'Gedung A, Lobi', jumlahUnit: 4, status: UnitStatus.mencukupi),
  ];

  int get totalEcoPoints =>
      reports.where((r) => r.status == ReportStatus.terverifikasi).fold(0, (sum, r) => sum + r.poin);

  int get laporanHariIni {
    final now = DateTime.now();
    return reports
        .where((r) => r.waktu.year == now.year && r.waktu.month == now.month && r.waktu.day == now.day)
        .length;
  }

  ReportModel addReport({
    required String area,
    required String lantai,
    required String titikSpesifik,
    required bool adaFoto,
  }) {
    final report = ReportModel(
      id: 'R${reports.length + 1}',
      area: area,
      lantai: lantai,
      titikSpesifik: titikSpesifik,
      lokasiLabel: '$area $lantai',
      adaFoto: adaFoto,
      status: ReportStatus.menunggu,
      poin: 10,
      waktu: DateTime.now(),
      mahasiswaId: mahasiswa.id,
      mahasiswaNama: mahasiswa.nama,
    );
    reports.insert(0, report);
    return report;
  }

  void selesaikanTugas(String taskId) {
    final task = csTasks.firstWhere((t) => t.id == taskId);
    csTasks.remove(task);
    riwayatSelesai.insert(
      0,
      SelesaiTaskModel(
        id: 'S${riwayatSelesai.length + 1}',
        lokasi: task.lokasi,
        titik: task.titik,
        waktuSelesaiLabel: 'Selesai baru saja · Auto-close otomatis',
      ),
    );
  }

  void ajukanUnitBaru(String lokasi, int jumlahUnit) {
    trashUnits.add(
      TrashUnitModel(
        id: 'U${trashUnits.length + 1}',
        lokasi: lokasi,
        jumlahUnit: jumlahUnit,
        status: UnitStatus.mencukupi,
      ),
    );
  }
}

final appStore = MockDataStore.instance;

// --- Fix: UI getters for enums ---
// TaskStatus values used: mendesak, normal, ditangani
extension TaskStatusX on TaskStatus {
  Color get dotColor {
    switch (this) {
      case TaskStatus.mendesak:
        return Colors.red;
      case TaskStatus.normal:
        return Colors.orange;
      case TaskStatus.ditangani:
        return Colors.green;
    }
  }
}

// UnitStatus values used: seringPenuh, kapasitasKurang, mencukupi
extension UnitStatusX on UnitStatus {
  Color get dotColor {
    switch (this) {
      case UnitStatus.seringPenuh:
        return Colors.red;
      case UnitStatus.kapasitasKurang:
        return Colors.orange;
      case UnitStatus.mencukupi:
        return Colors.green;
    }
  }

  String get label {
    switch (this) {
      case UnitStatus.seringPenuh:
        return 'Sering Penuh';
      case UnitStatus.kapasitasKurang:
        return 'Kapasitas Kurang';
      case UnitStatus.mencukupi:
        return 'Mencukupi';
    }
  }
}