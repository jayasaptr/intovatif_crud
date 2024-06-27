part of 'mahasiswa_bloc.dart';

@immutable
sealed class MahasiswaState {}

final class MahasiswaInitial extends MahasiswaState {}

final class MahasiswaLoading extends MahasiswaState {}

final class MahasiswaSuccess extends MahasiswaState {
  final List<MahasiswaModel> mahasiswa;

  MahasiswaSuccess(this.mahasiswa);
}

final class MahasiswaFailure extends MahasiswaState {
  final String message;

  MahasiswaFailure(this.message);
}

final class MahasiswaInsertSuccess extends MahasiswaState {
  final List<MahasiswaModel> mahasiswa;

  MahasiswaInsertSuccess(this.mahasiswa);
}

final class MahasiswaInsertFailure extends MahasiswaState {
  final String message;

  MahasiswaInsertFailure(this.message);
}

final class MahasiswaUpdateSuccess extends MahasiswaState {
  final List<MahasiswaModel> mahasiswa;

  MahasiswaUpdateSuccess(this.mahasiswa);
}

final class MahasiswaUpdateFailure extends MahasiswaState {
  final String message;

  MahasiswaUpdateFailure(this.message);
}

final class MahasiswaDeleteSuccess extends MahasiswaState {
  final List<MahasiswaModel> mahasiswa;

  MahasiswaDeleteSuccess(this.mahasiswa);
}

final class MahasiswaDeleteFailure extends MahasiswaState {
  final String message;

  MahasiswaDeleteFailure(this.message);
}

final class MahasiswaGetDataSuccess extends MahasiswaState {
  final List<MahasiswaModel> mahasiswa;

  MahasiswaGetDataSuccess(this.mahasiswa);
}

final class MahasiswaGetDataFailure extends MahasiswaState {
  final String message;

  MahasiswaGetDataFailure(this.message);
}

