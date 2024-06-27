class MahasiswaModel {
  int? id;
  String? nama;
  String? nim;
  String? jurusan;
  String? alamat;

  MahasiswaModel({this.id, this.nama, this.nim, this.jurusan, this.alamat});

  factory MahasiswaModel.fromJson(Map<String, dynamic> json) {
    return MahasiswaModel(
      id: json['id'],
      nama: json['nama'],
      nim: json['nim'],
      jurusan: json['jurusan'],
      alamat: json['alamat'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'nim': nim,
      'jurusan': jurusan,
      'alamat': alamat,
    };
  }
}
