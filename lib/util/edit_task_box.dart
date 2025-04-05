// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:listadetarefas/util/meu_botao.dart';

class EditTaskBox extends StatelessWidget {
  final controller;
  final String tarefaAntiga;
  VoidCallback onSave;
  VoidCallback onCanceled;

  EditTaskBox({
    super.key,
    required this.tarefaAntiga,
    required this.controller,
    required this.onSave,
    required this.onCanceled
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(
          "Editar Tarefa",
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
      ),

      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Pegar Input do Usuário
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: tarefaAntiga
              ),

            ),

            // Botões de Salvar e Cancelar
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Salvar
                MeuBotao(text: "Salvar", onPressed: onSave),

                const SizedBox(width: 64), // Separação

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
