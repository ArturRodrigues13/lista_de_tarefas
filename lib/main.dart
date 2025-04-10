// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:listadetarefas/pages/settings.dart';
import 'package:listadetarefas/pages/home_page.dart';
import 'package:listadetarefas/util/desktop_init.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized(); // Garante a inicialização do Flutter

  // Inicializar a "Hive"
  await Hive.initFlutter();
  await initDesktop();

  // Abrir uma "Caixa"
  var box = await Hive.openBox("Minha Caixa");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.amber
      ),
      home: HomePage(),
      routes: {
        '/homepage': (context) => HomePage(),
        '/settings': (context) => Settings(),
      },
    );
  }
}
