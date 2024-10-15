class Mahasiswa {
  final int id;
  final String name;
  final String nim;
  final String tahunLulus;
  final String noTelp;
  final String email;
  final String alamat;

  Mahasiswa(
      {required this.id,
      required this.name,
      required this.nim,
      required this.tahunLulus,
      required this.noTelp,
      required this.email,
      required this.alamat});

  factory Mahasiswa.fromMap(Map<String, dynamic> map) {
    return Mahasiswa(
      id: map['id'],
      name: map['name'],
      nim: map['nim'],
      tahunLulus: map['tahunlulus'],
      noTelp: map['nomor_telepon'],
      email: map['email'],
      alamat: map['alamat_rumah'],
    );
  }
}
