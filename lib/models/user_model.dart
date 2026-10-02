enum UserRole { mahasiswa, cs, sarpras }

class UserModel {
  final String id;
  final String nama;
  final String email;
  final UserRole role;

  // Mahasiswa
  final String? nim;
  final String? prodi;
  final int laporanTerverifikasi;

  // Petugas CS
  final String? shift;
  final String? areaTugas;
  final int tugasSelesaiBulanIni;

  // Sarpras
  final String? deskripsiTim;

  const UserModel({
    required this.id,
    required this.nama,
    required this.email,
    required this.role,
    this.nim,
    this.prodi,
    this.laporanTerverifikasi = 0,
    this.shift,
    this.areaTugas,
    this.tugasSelesaiBulanIni = 0,
    this.deskripsiTim,
  });

  String get initials {
    final parts = nama.trim().split(' ');
    if (parts.length == 1) return parts.first.substring(0, 1).toUpperCase();
    return (parts.first.substring(0, 1) + parts.last.substring(0, 1)).toUpperCase();
  }
}
