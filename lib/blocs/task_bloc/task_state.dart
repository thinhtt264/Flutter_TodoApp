part of 'task_bloc.dart';

enum TaskStatus { initial, loading, success, error }

class TaskState extends Equatable {
  final List<Task> tasks;
  final TaskStatus status;

  const TaskState({
    this.tasks = const <Task>[],
    this.status = TaskStatus.initial,
  });
  @override
  List<Object?> get props => [tasks, status];

  TaskState copyWith({List<Task>? tasks, TaskStatus? status}) {
    return TaskState(tasks: tasks ?? this.tasks, status: status ?? this.status);
  }

  Map<String, dynamic> toJson() {
    return {
      'tasks': tasks,
    };
  }
}
