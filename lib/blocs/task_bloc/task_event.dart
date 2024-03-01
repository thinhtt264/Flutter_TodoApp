part of 'task_bloc.dart';

@immutable
abstract class TaskEvent {
  final Function(dynamic)? callback;
  const TaskEvent({this.callback});
}

class GetAllTasksEvent extends TaskEvent {}

class AddTaskEvent extends TaskEvent {
  final Task task;

  const AddTaskEvent({required this.task, Function(dynamic)? callback})
      : super(callback: callback);
}

class UpdateTaskEvent extends TaskEvent {
  final Task task;
  const UpdateTaskEvent({required this.task});
}

class CompleteTaskEvent extends TaskEvent {
  final bool isCompleted;
  final int id;
  const CompleteTaskEvent({required this.isCompleted, required this.id});
}

class DeleteTaskEvent extends TaskEvent {
  final Task task;
  const DeleteTaskEvent({required this.task});
}
