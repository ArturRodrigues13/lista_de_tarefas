// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:listadetarefas/util/theme_settings.dart';

class MeuBotao extends StatelessWidget {
  final Widget text;
  VoidCallback onPressed;

  MeuBotao({
    super.key,
    required this.text,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: ThemeSettings.primaryColor,
      child: text,
    );
  }
}
