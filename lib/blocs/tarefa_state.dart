import 'package:learn_bloc/models/tarefa_model.dart';

abstract class TarefaState {
  final List<TarefaModel> tarefas;

  TarefaState({required this.tarefas});
}

class TarefasInitialState extends TarefaState {
  TarefasInitialState() : super(tarefas: []);
}

class TarefasILoadingState extends TarefaState {
  TarefasILoadingState() : super(tarefas: []);
}

class TarefasILoadedState extends TarefaState {
  TarefasILoadedState({required List<TarefaModel> tarefas})
      : super(tarefas: tarefas);
}

class TarefasErrorState extends TarefaState {
  final Exception exception;
  TarefasErrorState({required this.exception}) : super(tarefas: []);
}
