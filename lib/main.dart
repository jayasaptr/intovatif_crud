import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tes_crud/bloc/mahasiswa/mahasiswa_bloc.dart';
import 'package:tes_crud/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => MahasiswaBloc()),
        ],
        child: const MaterialApp(
          title: "Tes CRUD",
          home: HomePage(),
        ));
  }
}
