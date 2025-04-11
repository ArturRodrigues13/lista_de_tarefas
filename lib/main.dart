// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:listadetarefas/pages/themes_page.dart';
import 'package:listadetarefas/pages/home_page.dart';
import 'package:listadetarefas/util/desktop_init.dart';
import 'package:listadetarefas/util/theme_settings.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized(); // Garante a inicialização do Flutter

  // Inicializar a "Hive"
  await Hive.initFlutter();
  await initDesktop();

  // Abrir uma "Caixa"
  var box = await Hive.openBox("Minha Caixa");

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final settingsBox = Hive.box('Minha Caixa');

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: settingsBox.listenable(keys: ['themeColor']),
      builder: (context, box, widget) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: ThemeSettings.getThemeColor(),
            scaffoldBackgroundColor: ThemeSettings.getThemeColor(),
          ),
          home: HomePage(),
          routes: {
            '/homepage': (context) => HomePage(),
            '/themes': (context) => Themes(),
          },
        );
      },
	  );
  }
}
