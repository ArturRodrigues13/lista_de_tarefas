import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {

  // Inicializa a Lista
  List TarefasLista = [];


  // Referenciar a Caixa Hive
  final _myBox = Hive.box("Minha Caixa");


  // Chamar essa função se for a primeira vez abrindo o Aplicativo
  void criarDataInicial () {
    TarefasLista = [
      ["Para adicionar tarefas, clique no +",false],
      ["Para deletar tarefas, me arraste para o lado",false]
    ];
  }

  // Carregar os dados da DataBase
  void carregarDados() {
    TarefasLista = _myBox.get("TAREFASLISTA");
  }

  // Atualizar o DataBase
  void atualizarDataBase() {
    _myBox.put("TAREFASLISTA", TarefasLista);
  }
}
