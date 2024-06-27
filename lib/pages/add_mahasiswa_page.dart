import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tes_crud/bloc/mahasiswa/mahasiswa_bloc.dart';
import 'package:tes_crud/model/mahasiswa_model.dart';

class AddMahasiswaPage extends StatefulWidget {
  const AddMahasiswaPage({super.key});

  @override
  State<AddMahasiswaPage> createState() => _AddMahasiswaPageState();
}

class _AddMahasiswaPageState extends State<AddMahasiswaPage> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _jurusanController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Mahasiswa'),
      ),
      body: BlocConsumer<MahasiswaBloc, MahasiswaState>(
        listener: (context, state) {
          if (state is MahasiswaInsertSuccess) {
            Navigator.pop(context);
          }

          if (state is MahasiswaInsertFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }

          if (state is MahasiswaFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _namaController,
                  decoration: const InputDecoration(
                    labelText: 'Nama',
                  ),
                ),
                TextField(
                  controller: _nimController,
                  decoration: const InputDecoration(
                    labelText: 'NIM',
                  ),
                ),
                TextField(
                  controller: _jurusanController,
                  decoration: const InputDecoration(
                    labelText: 'Jurusan',
                  ),
                ),
                TextField(
                  controller: _alamatController,
                  decoration: const InputDecoration(
                    labelText: 'Alamat',
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    context.read<MahasiswaBloc>().add(
                          MahasiswaInsert(
                            MahasiswaModel(
                              nama: _namaController.text,
                              nim: _nimController.text,
                              jurusan: _jurusanController.text,
                              alamat: _alamatController.text,
                            ),
                          ),
                        );
                  },
                  child: const Text('Simpan'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
