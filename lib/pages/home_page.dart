import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tes_crud/bloc/mahasiswa/mahasiswa_bloc.dart';
import 'package:tes_crud/pages/add_mahasiswa_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tes CRUD'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddMahasiswaPage(),
                  ));
            },
          ),
        ],
      ),
      body: BlocBuilder<MahasiswaBloc, MahasiswaState>(
        builder: (context, state) {
          if (state is MahasiswaLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is MahasiswaGetDataSuccess) {
            return ListView.builder(
              itemCount: state.mahasiswa.length,
              itemBuilder: (context, index) {
                final mahasiswa = state.mahasiswa[index];
                return ListTile(
                  title: Text(mahasiswa.nama ?? ""),
                  subtitle: Text(mahasiswa.jurusan ?? ""),
                );
              },
            );
          } else {
            return const Center(
              child: Text('Data tidak ditemukan'),
            );
          }
        },
      ),
    );
  }
}
