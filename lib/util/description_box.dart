// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:listadetarefas/util/meu_botao.dart';
import 'package:listadetarefas/util/theme_settings.dart';

class DescriptionBox extends StatelessWidget {

  final String nomeDaTarefa;
  final String descricaoDaTarefa;
  VoidCallback onCanceled;

  DescriptionBox({
    super.key,
    required this.nomeDaTarefa,
    required this.descricaoDaTarefa,
    required this.onCanceled
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(
          nomeDaTarefa,
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
      ),

      backgroundColor: ThemeSettings.lightColor,
      content: Container(
        width: 275,
        height: double.maxFinite,
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.topLeft,
                child: Text(
                  style: TextStyle(
                    fontSize: 16
                  ),
                  descricaoDaTarefa
                ),
              ),
            ),

            MeuBotao(
              text: Text(
                "Fechar",
                style: TextStyle(
                  color: ThemeSettings.getSecondaryColor()
                ),
              ),
              onPressed: onCanceled
            )
          ],
        ),
      ),
    );
  }
}
