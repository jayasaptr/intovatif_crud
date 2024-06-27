part of 'mahasiswa_bloc.dart';

@immutable
sealed class MahasiswaEvent {}

final class MahasiswaGetData extends MahasiswaEvent {}

final class MahasiswaInsert extends MahasiswaEvent {
  final MahasiswaModel mahasiswa;

  MahasiswaInsert(this.mahasiswa);
}

final class MahasiswaUpdate extends MahasiswaEvent {
  final MahasiswaModel mahasiswa;

  MahasiswaUpdate(this.mahasiswa);
}

final class MahasiswaDelete extends MahasiswaEvent {
  final int id;

  MahasiswaDelete(this.id);
}
