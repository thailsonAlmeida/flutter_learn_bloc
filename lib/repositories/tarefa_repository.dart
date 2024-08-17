import 'package:learn_bloc/models/tarefa_model.dart';

class TarefaRepository {
  final List<TarefaModel> _tarefas = [];

  Future<List<TarefaModel>> getTarefas() async {
    _tarefas.addAll([
      TarefaModel(nome: 'Compras no mercado'),
      TarefaModel(nome: 'Fazer exercicio'),
      TarefaModel(nome: 'Buscar filhos na escola'),
      TarefaModel(nome: 'Jogar video game'),
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
