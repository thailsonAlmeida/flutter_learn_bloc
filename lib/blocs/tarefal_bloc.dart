import 'dart:async';

import 'package:learn_bloc/blocs/tarefa_event.dart';
import 'package:learn_bloc/blocs/tarefa_state.dart';
import 'package:learn_bloc/models/tarefa_model.dart';
import 'package:learn_bloc/repositories/tarefa_repository.dart';

class TarefaBloc {
  final _repository = TarefaRepository();

  final StreamController<TarefaEvent> _inputTarefaController =
      StreamController<TarefaEvent>();

  final StreamController<TarefaState> _outputTarefaController =
      StreamController<TarefaState>();

  Sink<TarefaEvent> get inputTarefa => _inputTarefaController.sink;
  Stream<TarefaState> get outputTarefa => _outputTarefaController.stream;

  TarefaBloc() {
    _inputTarefaController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(TarefaEvent event) async {
    List<TarefaModel> tarefas = [];

    _outputTarefaController.add(TarefasILoadingState());

    if (event is GetTarefas) {
      tarefas = await _repository.getTarefas();
    } else if (event is PostTarefa) {
      tarefas = await _repository.postTarefa(tarefa: event.tarefa);
    } else if (event is DeleteTarefa) {
      tarefas = await _repository.deleteTarefa(tarefa: event.tarefa);
    }

    _outputTarefaController.add(TarefasILoadedState(tarefas: tarefas));
  }
}
