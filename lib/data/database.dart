// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {

  // Inicializa a Lista
  List TarefasLista = [];
  List TarefasLixeira = [];


  // Referenciar a Caixa Hive
  final _myBox = Hive.box("Minha Caixa");


  // Chamar essa função se for a primeira vez abrindo o Aplicativo
  void criarDataInicial () {
    TarefasLista = [
      ["Para adicionar tarefas, clique no +",false],
      ["Para deletar tarefas, me arraste para o lado",false]
    ];

    TarefasLixeira = [
      ["Para tirar uma tarefa da lixeira, me arraste para o lado",false]
    ];
  }

  // Carregar os dados da DataBase
  void carregarDados() {
    TarefasLista = _myBox.get("TAREFASLISTA");
    TarefasLixeira = _myBox.get("TAREFASLIXEIRA");
  }

  // Atualizar o DataBase
  void atualizarDataBase() {
    _myBox.put("TAREFASLISTA", TarefasLista);
    _myBox.put("TAREFASLIXEIRA", TarefasLixeira);
  }
}
