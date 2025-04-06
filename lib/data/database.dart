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
      ["Para adicionar tarefas, clique no +","Tá procurando o que?",false],
      ["Para deletar tarefas, me arraste para o lado","Farmácias são a máfia brasileira",false],
      ["Para ver a descrição de uma tarefa, clique nela","DESCRIÇÃO SUPER INCRÍVEL!!!",false],
      ["Para abrir a lixeira, clique no botão acima do +","Acho que você apertou no lugar errado",false]
    ];

    TarefasLixeira = [
      ["Para me retirar da lixeira, clique neste botão =>","Kendrick > Abismo > Drake",false],
      ["Para limpar a lixeira, bom, tem o botão ali né","Mensagem super secreta uauuuuu",false]
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
