import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:listadetarefas/data/database.dart';
import 'package:listadetarefas/util/dialog_box.dart';
import 'package:listadetarefas/util/edit_task_box.dart';
import 'package:listadetarefas/util/meu_botao.dart';
import 'package:listadetarefas/util/todo_tile.dart';
import 'package:listadetarefas/util/trash_hold.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // Referenciar a Caixa Hive
  final _myBox = Hive.box("Minha Caixa");
  ToDoDataBase db = ToDoDataBase(); // Instância do DataBase

  @override
  void initState() {
    // Se é a primeira vez que o Aplicativo é aberto, criar Data padrão

    if (_myBox.get("TAREFASLISTA") == null) {

      db.criarDataInicial();

    } else {
    // Já existem dados no DataBase
      db.carregarDados();
    }

	super.initState();
  }



  // Controlador de Texto
  final _controller = TextEditingController();


  // Clicou na CheckBox
  void checkBoxChanged(bool? value, index) {
    setState(() {
      db.TarefasLista[index][1] = !db.TarefasLista[index][1];
    });
    db.atualizarDataBase();
  }

  // Clicou no Botão de Salvar
  void salvarNovaTarefa() {

    if (_controller.text.isEmpty) {

    } else {

      setState(() {
      db.TarefasLista.add([_controller.text,false]);
      _controller.clear();

    });

    Navigator.of(context).pop();
    db.atualizarDataBase();
    }
  }

  // Clicou no Botão de Adicionar Tarefa
  void criarNovaTarefaBox () {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: salvarNovaTarefa,
          onCanceled: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void editarTarefa (int index) {

    if (_controller.text.isEmpty) {

    } else {

      setState(() {
      db.TarefasLista[index][0] = _controller.text;
      _controller.clear();
    });

    Navigator.of(context).pop();
    db.atualizarDataBase();
    }

  }

  void editarTarefaBox (int index) {
    showDialog(
      context: context,
      builder: (context) {
        return EditTaskBox(
          controller: _controller,
          onSave: () => editarTarefa(index),
          onCanceled: () => Navigator.of(context).pop(),
          tarefaAntiga: db.TarefasLista[index][0],
        );
      },
    );
  }


  // Deletar Tarefa
  void deletarTarefa(int index) {
    setState(() {
      db.TarefasLixeira.add(db.TarefasLista[index]);
      db.TarefasLista.removeAt(index);
    });
    db.atualizarDataBase();
  }

  void recuperarTarefa(int index) {
    setState(() {
      db.TarefasLista.add(db.TarefasLixeira[index]);
      db.TarefasLixeira.removeAt(index);
    });
    db.atualizarDataBase();

    if (db.TarefasLixeira.length < 1)
      Navigator.of(context).pop();
  }

  void abrirLixeira() {
  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            backgroundColor: const Color.fromARGB(255, 248, 230, 156),
            title: Center(child: const Text(
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
              "LIXEIRA")
            ),
            content: SizedBox(

              width: double.maxFinite,
              child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: db.TarefasLixeira.length,
                      itemBuilder: (context, index) {
                        return TrashHold(
                          recuperarTarefa: (context) {
                            setState(() {
                              recuperarTarefa(index); // Atualiza o estado local
                            });
                          },
                          itemLixeira: db.TarefasLixeira[index][0],
                        );
                      },
                    ),
                  ),

				actions: [
                Row(
				  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
					MeuBotao(
						text: "Limpar Lixeira",
						onPressed: () => setState(() {
							limparLixeira();
						})
					),

					MeuBotao(
						text: "Fechar",
            			onPressed: () => Navigator.of(context).pop()
					),
                  ],
                ),
			    ],
          );
        },
      );
    },
  );
}

  void limparLixeira() {
	setState(() {
	db.TarefasLixeira.clear();
	db.atualizarDataBase();
	});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.amber[300],
        title: Text("LISTA DE TAREFAS"),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold
        ),
        centerTitle: true,
      ),
        floatingActionButton: Stack(
		    children: [
			    Positioned(
            right: 17,
            bottom: 80,
		        child: FloatingActionButton(
              mini: true,
		          backgroundColor: Colors.amber,
		          shape: CircleBorder(),
		          onPressed: abrirLixeira,
		          child: Icon(
			          Icons.delete,
			          color: Colors.black,
		          ),
		        )

		      ),
			    Positioned(
					right: 10,
					bottom: 10,
					child: FloatingActionButton(
						backgroundColor: Colors.amber,
						shape: CircleBorder(),
						onPressed: criarNovaTarefaBox,
						child: Icon(
							Icons.add,
							color: Colors.black,
		         		),
		        	)
		      	),
		    ],
	    ),
      	body: ListView.builder(
        itemCount: db.TarefasLista.length,
        itemBuilder: (context, index) {
          return ToDoTile(
          nomeDaTarefa: db.TarefasLista[index][0],
          tarefaFeita: db.TarefasLista[index][1],
          onChanged: (value) => checkBoxChanged(value,index),
          deletarFuncao: (context) => deletarTarefa(index),
          editarFuncao: (context) => editarTarefaBox(index),
          );
        }
      )
    );
  }
}
