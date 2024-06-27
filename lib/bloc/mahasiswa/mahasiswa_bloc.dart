import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tes_crud/data/mahasiswa.dart';
import 'package:tes_crud/model/mahasiswa_model.dart';

part 'mahasiswa_event.dart';
part 'mahasiswa_state.dart';

class MahasiswaBloc extends Bloc<MahasiswaEvent, MahasiswaState> {
  MahasiswaBloc() : super(MahasiswaInitial()) {
    on<MahasiswaGetData>((event, emit) async {
      emit(MahasiswaLoading());
      try {
        final data = await DatabaseMahasiswa.db.getData();
        final List<MahasiswaModel> mahasiswa = data
            .map((e) => MahasiswaModel(
                  id: e['id'],
                  nama: e['nama'],
                  nim: e['nim'],
                  jurusan: e['jurusan'],
                  alamat: e['alamat'],
                ))
            .toList();

        emit(MahasiswaGetDataSuccess(mahasiswa));
      } catch (e) {
        emit(MahasiswaFailure(e.toString()));
      }
    });

    on<MahasiswaInsert>((event, emit) async {
      emit(MahasiswaLoading());
      try {
        final data =
            await DatabaseMahasiswa.db.insert(event.mahasiswa.toJson());
        if (data > 0) {
          final data = await DatabaseMahasiswa.db.getData();
          final List<MahasiswaModel> mahasiswa = data
              .map((e) => MahasiswaModel(
                    nama: e['nama'],
                    nim: e['nim'],
                    jurusan: e['jurusan'],
                    alamat: e['alamat'],
                  ))
              .toList();

          emit(MahasiswaInsertSuccess(mahasiswa));
        } else {
          emit(MahasiswaInsertFailure('Gagal menambahkan data'));
        }
      } catch (e) {
        emit(MahasiswaInsertFailure(e.toString()));
      }
    });

    on<MahasiswaUpdate>((event, emit) async {
      emit(MahasiswaLoading());
      try {
        final data =
            await DatabaseMahasiswa.db.update(event.mahasiswa.toJson());
        if (data > 0) {
          final data = await DatabaseMahasiswa.db.getData();
          final List<MahasiswaModel> mahasiswa = data
              .map((e) => MahasiswaModel(
                    id: e['id'],
                    nama: e['nama'],
                    nim: e['nim'],
                    jurusan: e['jurusan'],
                    alamat: e['alamat'],
                  ))
              .toList();

          emit(MahasiswaUpdateSuccess(mahasiswa));
        } else {
          emit(MahasiswaUpdateFailure('Gagal mengubah data'));
        }
      } catch (e) {
        emit(MahasiswaUpdateFailure(e.toString()));
      }
    });

    on<MahasiswaDelete>((event, emit) async {
      emit(MahasiswaLoading());
      try {
        final data = await DatabaseMahasiswa.db.delete(event.id);
        if (data > 0) {
          final data = await DatabaseMahasiswa.db.getData();
          final List<MahasiswaModel> mahasiswa = data
              .map((e) => MahasiswaModel(
                    id: e['id'],
                    nama: e['nama'],
                    nim: e['nim'],
                    jurusan: e['jurusan'],
                    alamat: e['alamat'],
                  ))
              .toList();

          emit(MahasiswaDeleteSuccess(mahasiswa));
        } else {
          emit(MahasiswaDeleteFailure('Gagal menghapus data'));
        }
      } catch (e) {
        emit(MahasiswaDeleteFailure(e.toString()));
      }
    });
  }
}
