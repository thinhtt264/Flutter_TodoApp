import 'package:equatable/equatable.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent()

  @override
  List<Object> get props => [];
}

class AddTaskEvent extends TaskEvent {}

class UpdateTaskEvent extends TaskEvent {}

class DeleteTaskEvent extends TaskEvent {
  final int id;
  DeleteTaskEvent({required this.id});
}
