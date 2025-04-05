import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

Future<void> initDesktop() async {

  if (!Platform.isAndroid && !Platform.isIOS) {
    await windowManager.ensureInitialized();
     const windowOptions = WindowOptions(
      minimumSize: Size(400, 600),
      size: Size(800, 600),
      title: "Lista de Tarefas",
    );

    await windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }
}
