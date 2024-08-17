import 'package:learn_bloc/models/tarefa_model.dart';

class TarefaRepository {
  final List<TarefaModel> _tarefas = [];

  Future<List<TarefaModel>> getTarefas() async {
    _tarefas.addAll([
      TarefaModel(nome: 'Reforçar os fundamentos de OO'),
      TarefaModel(nome: 'Estudar Spring Boot API'),
      TarefaModel(nome: 'Prototipar a tela do APP final'),
      TarefaModel(nome: 'Pesquisar Tópico 03 do seminário'),
      TarefaModel(nome: 'Implementar +1 desing patterns no caixa'),
      TarefaModel(nome: 'Preparar-se para apresentação final do caixa'),
      TarefaModel(nome: 'Preparar conograma de estudo para o 2º semestre'),
    ]);
    return Future.delayed(
      const Duration(seconds: 2),
      () => _tarefas,
    );
  }

  Future<List<TarefaModel>> postTarefa({required TarefaModel tarefa}) async {
    _tarefas.add(tarefa);
    return Future.delayed(const Duration(seconds: 2), () => _tarefas);
  }

  Future<List<TarefaModel>> deleteTarefa({required TarefaModel tarefa}) async {
    _tarefas.remove(tarefa);
    return Future.delayed(const Duration(seconds: 2), () => _tarefas);
  }
}
