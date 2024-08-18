// ignore_for_file: override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:learn_bloc/blocs/tarefa_event.dart';
import 'package:learn_bloc/blocs/tarefa_state.dart';
import 'package:learn_bloc/blocs/tarefal_bloc.dart';
import 'package:learn_bloc/models/tarefa_model.dart';

class TarefasPage extends StatefulWidget {
  const TarefasPage({super.key});

  @override
  State<TarefasPage> createState() => _TarefasPageState();
}

class _TarefasPageState extends State<TarefasPage> {
  late final TarefaBloc _tarefaBloc;

  @override
  void initState() {
    super.initState();
    _tarefaBloc = TarefaBloc();
    _tarefaBloc.inputTarefa.add(GetTarefas());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.crop_square,
          color: Colors.redAccent,
        ),
        backgroundColor: Colors.black,
        title: const Text(
          'BLoC Pattern',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 30, right: 8.0, left: 8.0, bottom: 8.0),
        child: StreamBuilder<TarefaState>(
            stream: _tarefaBloc.outputTarefa,
            builder: (context, state) {
              if (state.data is TarefasILoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state.data is TarefasILoadedState) {
                final list = state.data?.tarefas ?? [];
                return ListView.separated(
                  separatorBuilder: (_, __) => const Divider(),
                  itemCount: list.length,
                  itemBuilder: (_, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        child: Center(
                          child: Text(
                            list[index].nome[0],
                          ),
                        ),
                      ),
                      title: Text(list[index].nome),
                      trailing: IconButton(
                        onPressed: () {
                          _tarefaBloc.inputTarefa.add(
                            DeleteTarefa(
                              tarefa: list[index],
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.delete_forever_rounded,
                          color: Colors.red,
                        ),
                      ),
                    );
                  },
                );
              }
              return const Center(child: Text('Error'));
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _tarefaBloc.inputTarefa.add(
            PostTarefa(
              tarefa: TarefaModel(
                nome: 'Estudar Gerenciamento de Estado BLoc',
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    _tarefaBloc.inputTarefa.close();
    super.dispose();
  }
}
