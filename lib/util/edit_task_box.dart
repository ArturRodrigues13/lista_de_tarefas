// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:listadetarefas/util/meu_botao.dart';
import 'package:listadetarefas/util/scale.dart';

class EditTaskBox extends StatelessWidget {
  final controller;
  final descricaoController;
  final String tarefaAntiga;
  VoidCallback onSave;
  VoidCallback onCanceled;

  EditTaskBox({
    super.key,
    required this.tarefaAntiga,
    required this.controller,
    required this.descricaoController,
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
        width: 275,
        height: double.maxFinite,
        child: Column(
          children: [
            // Pegar Input do Usuário
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: tarefaAntiga
              ),
            ),

            const SizedBox(height: 24),

            Flexible(
              child: TextField(
                controller: descricaoController,
                maxLines: null,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Atualizar Descrição"
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Botões de Salvar e Cancelar
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Salvar
                Scale(child: MeuBotao(text: Text("Salvar"), onPressed: onSave)),

                const SizedBox(width: 64), // Separação

                // Cancelar
                Scale(child: MeuBotao(text: Text("Cancelar"), onPressed: onCanceled))
              ],
            )
          ],
        ),
      ),
    );
  }
}
