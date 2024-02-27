import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/data.dart';
import 'package:flutter_application_1/services/service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'task_event.dart';
part 'task_state.dart';
part 'task_provider.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskState()) {
    on<AddTaskEvent>((event, emit) => _addTask(event, emit));
    on<DeleteTaskEvent>((event, emit) => _deleteTask(event, emit));
    on<GetAllTasksEvent>((event, emit) => _getAllTasks(event, emit));
    on<CompleteTaskEvent>((event, emit) => _completeTask(event, emit));
  }
  final DatabaseService db = DatabaseService();

  void _addTask(AddTaskEvent event, Emitter<TaskState> emit) {
    db.addTask(event.task);
    List<Task> temp = List.of(state.tasks);
    temp.insert(0, event.task);

    emit(state.copyWith(
      tasks: temp,
    ));
  }

  void _deleteTask(DeleteTaskEvent event, Emitter<TaskState> emit) {
    db.deleteTask(event.task);
    List<Task> temp = List.of(state.tasks);
    temp.remove(event.task);

    emit(state.copyWith(
      tasks: temp,
    ));
  }

  void _completeTask(CompleteTaskEvent event, Emitter<TaskState> emit) {
    List<Task> temp = List.of(state.tasks);

    int index = temp.indexWhere((task) => task.id == event.id);
    if (index != -1) {
      temp[index] = temp[index].copyWith(isCompleted: event.isCompleted);
      db.updateTask(temp[index]);
    }

    emit(state.copyWith(
      tasks: temp,
    ));
  }

  Future<void> _getAllTasks(
      GetAllTasksEvent event, Emitter<TaskState> emit) async {
    final tasks = await db.getAllTasks();

    if (tasks.length == state.tasks.length) {
      return;
    } else {
      emit(state.copyWith(tasks: tasks));
    }
  }
}
