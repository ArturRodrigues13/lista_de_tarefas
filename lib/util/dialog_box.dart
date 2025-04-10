// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:listadetarefas/util/error_message.dart';
import 'package:listadetarefas/util/meu_botao.dart';
import 'package:listadetarefas/util/scale.dart';
import 'package:listadetarefas/util/theme_settings.dart';

class DialogBox extends StatelessWidget {
  final controller;
  final descricaoController;
  VoidCallback onSave;
  VoidCallback onCanceled;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCanceled,
    required this.descricaoController
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(
          "Criar Tarefa",
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
            // Pegar Input do Usuário
            TextField(
              maxLength: 60,
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Nome da Tarefa",
              ),
            ),

            const SizedBox(height: 24),

            Flexible(
              child: TextField(
                controller: descricaoController,
                maxLines: null,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Descrição da Tarefa"
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Botões de Salvar e Cancelar
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Salvar
                Scale(
                  child: MeuBotao(
                    text: Text(
                      "Salvar",
                      style: TextStyle(
                        color: ThemeSettings.getSecondaryColor()
                      ),
                    ),
                    onPressed: () {
                      if (controller.text.isEmpty) {
                        showErrorDialog(context, "A Tarefa Precisa de um Nome!");
                      }
                      else {
                        onSave();
                      }
                    }
                  ),
                ),

                const SizedBox(width: 64), // Separação

                // Cancelar
                Scale(
                  child: MeuBotao(
                    text: Text(
                      "Cancelar",
                      style: TextStyle(
                        color: ThemeSettings.getSecondaryColor()
                      ),
                    ),
                    onPressed: onCanceled
                  )
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
