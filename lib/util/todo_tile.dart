// ignore_for_file: sort_child_properties_last, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {

  final String nomeDaTarefa;
  final bool tarefaFeita;
  Function(bool?)? onChanged;
  Function(BuildContext)? deletarFuncao;

  ToDoTile({
    super.key,
    required this.nomeDaTarefa,
    required this.tarefaFeita,
    required this.onChanged,
    required this.deletarFuncao
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 25.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deletarFuncao,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(12),
            )
          ]
        ),
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

              // Nome da Tarefa
              Expanded(
                child: Text(
                  nomeDaTarefa,
                  style: TextStyle(
                    fontSize: 14,
                    decoration: tarefaFeita ? TextDecoration.lineThrough : TextDecoration.none
                  ),
                  softWrap: true,
                  overflow: TextOverflow.visible,
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.yellow[500],
            borderRadius: BorderRadius.circular(12)
          ),
        ),
      ),
    );
  }
}
