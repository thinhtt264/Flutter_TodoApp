part of 'task_bloc.dart';

enum TodoStatus { initial, loading, success, error }

class TaskState extends Equatable {
  final List<Task> tasks;
  const TaskState({
    this.tasks = const <Task>[],
  });
  @override
  List<Object?> get props => [tasks];

  TaskState copyWith({List<Task>? tasks}) {
    return TaskState(tasks: tasks ?? this.tasks);
  }

  Map<String, dynamic> toJson() {
    return {
      'tasks': tasks,
    };
  }
}
