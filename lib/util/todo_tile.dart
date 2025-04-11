// ignore_for_file: sort_child_properties_last, must_be_immutable

import 'package:flutter/material.dart';
import 'package:listadetarefas/util/theme_settings.dart';

class ToDoTile extends StatelessWidget {

  final String nomeDaTarefa;
  final String descricaoDaTarefa;
  final bool tarefaFeita;
  Function(bool?)? onChanged;
  Function(BuildContext)? deletarFuncao;
  Function(BuildContext)? editarFuncao;
  Function(BuildContext)? exibirDescricao;

  ToDoTile({
    super.key,
    required this.nomeDaTarefa,
    required this.descricaoDaTarefa,
    required this.tarefaFeita,
    required this.onChanged,
    required this.deletarFuncao,
    required this.editarFuncao,
    required this.exibirDescricao
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
      child: Padding(
        padding: const EdgeInsets.only(top: 7.5, left: 25.0,right: 25.0,),
        child: Dismissible(
          key: ValueKey(nomeDaTarefa), // Chave única para identificar o item
          direction: DismissDirection.endToStart, // Permite deslizar apenas para a esquerda
          onDismissed: (direction) {
            deletarFuncao!(context); // Executa a função de deletar
          },
          background: Container(
            decoration: BoxDecoration(
              color: ThemeSettings.darkColor,
              borderRadius: BorderRadius.circular(12.0)
            ),
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),

          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            hoverColor: ThemeSettings.darkColor,
            onTap: () => exibirDescricao!(context),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
                child: Container(
                  padding: const EdgeInsets.only(left: 15.0,right: 25.0,top: 25.0, bottom: 24),
                  child: Row(
                    children: [
                      // Check Box
                      Checkbox(
                        value: tarefaFeita,
                        onChanged: onChanged,
                        activeColor: Colors.black,
                      ),

                      const SizedBox(width: 10.0),

                      // Nome da Tarefa
                      Expanded(
                        child: Text(
                          nomeDaTarefa,
                          style: TextStyle(
							color: ThemeSettings.getSecondaryColor(),
                            fontSize: 16,
                            decoration: tarefaFeita ? TextDecoration.lineThrough : TextDecoration.none
                          ),
                          softWrap: true,
                          overflow: TextOverflow.visible,
                        ),
                      ),

                      IconButton(
                        onPressed: () => editarFuncao!(context),
                        icon: Icon(
                          Icons.edit,
                          color: ThemeSettings.getSecondaryColor(),
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: ThemeSettings.primaryColor,
                    borderRadius: BorderRadius.circular(12)
                  ),
                ),
              ),
            ),
          ),
        ),
    );
  }
}
