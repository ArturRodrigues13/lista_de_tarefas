import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lista_de_tarefas/data/database.dart';
import 'package:lista_de_tarefas/util/dialog_box.dart';
import 'package:lista_de_tarefas/util/todo_tile.dart';

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
  void criarNovaTarefa () {
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

  // Deletar Tarefa
  void deletarTarefa(int index) {
    setState(() {
      db.TarefasLista.removeAt(index);
    });
    db.atualizarDataBase();
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        shape: CircleBorder(),
        onPressed: criarNovaTarefa,
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),

      ),
      body: ListView.builder(
        itemCount: db.TarefasLista.length,
        itemBuilder: (context, index) {
          return ToDoTile(
          nomeDaTarefa: db.TarefasLista[index][0],
          tarefaFeita: db.TarefasLista[index][1],
          onChanged: (value) => checkBoxChanged(value,index),
          deletarFuncao: (context) => deletarTarefa(index),
          );
        }
      )
    );
  }
}
