import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TrashHold extends StatelessWidget {

  final String itemLixeira;
  Function(BuildContext)? recuperarTarefa;

  TrashHold({super.key, required this.itemLixeira, required this.recuperarTarefa});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0,right: 15.0,top: 7.5,bottom: 7.5),
      child: Container(
          padding: const EdgeInsets.only(left: 15.0,right: 15.0,top: 15.0, bottom: 15),
          decoration: BoxDecoration(
            color: Colors.yellow[500],
            borderRadius: BorderRadius.circular(12)
          ),
          child: Row(
            children: [

              // Nome da Tarefa
              Expanded(
                child: Text(
                  itemLixeira,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black87
                  ),
                  softWrap: true,
                  overflow: TextOverflow.visible,
                ),
              ),

              const SizedBox(width: 10), // Separação

              FloatingActionButton(
                hoverElevation: 0,
                elevation: 0,
                backgroundColor: const Color.fromARGB(0, 0, 0, 0),
                onPressed: () => recuperarTarefa?.call(context),
                child: Icon(
                  Icons.restore_from_trash,
                  color: Colors.black,
                  ),
                ),
            ],
          ),
        )
      );
  }
}
