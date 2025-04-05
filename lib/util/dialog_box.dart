// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:listadetarefas/util/meu_botao.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCanceled;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCanceled
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Pegar Input do Usuário
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Nova Tarefa"
              ),

            ),

            // Botões de Salvar e Cancelar
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Salvar
                MeuBotao(text: "Salvar", onPressed: onSave),

                const SizedBox(width: 8), // Separação

                // Cancelar
                MeuBotao(text: "Cancelar", onPressed: onCanceled)
              ],
            )
          ],
        ),
      ),
    );
  }
}
