part of 'task_bloc.dart';

@immutable
abstract class TaskEvent {
  const TaskEvent();
  @override
  List<Object?> get props => [];
}

class GetAllTasksEvent extends TaskEvent {}

class AddTaskEvent extends TaskEvent {
  final Task task;
  const AddTaskEvent({required this.task});
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
