// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lista_de_tarefas/pages/home_page.dart';
import 'package:window_manager/window_manager.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized(); // Garante a inicialização do Flutter

  // Inicializar a "Hive"
  await Hive.initFlutter();

  // Abrir uma "Caixa"
  var box = await Hive.openBox("Minha Caixa");

  await windowManager.ensureInitialized();

  WindowOptions windowOptions = WindowOptions(
  minimumSize: Size(400, 600),
  size: Size(800, 600),
  title: "Lista de Tarefas"
  );

  await windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

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
    );
  }
}
