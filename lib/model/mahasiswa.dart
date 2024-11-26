class Mahasiswa {
  final int id;
  final String name;
  final String nim;
  final String tahunLulus;
  final String noTelp;
  final String email;
  final String alamat;
  final String status;

  Mahasiswa({
    required this.id,
    required this.name,
    required this.nim,
    required this.tahunLulus,
    required this.noTelp,
    required this.email,
    required this.alamat,
    required this.status,
  });

  factory Mahasiswa.fromMap(Map<String, dynamic> map) {
    print(map);
    return Mahasiswa(
      id: map['id'],
      name: map['name'],
      nim: map['nim'],
      tahunLulus: map['tahunlulus'],
      noTelp: map['nomor_telepon'],
      email: map['email'],
      alamat: map['alamat_rumah'],
      status: map['status_saat_ini'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'nim': nim,
      'tahunlulus': tahunLulus,
      'nomor_telepon': noTelp,
      'email': email,
      'alamat_rumah': alamat,
      'status_saat_ini': status,
    };
  }
}
