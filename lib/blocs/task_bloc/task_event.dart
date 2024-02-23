abstract class TaskEvent{}

class AddTaskEvent extends TaskEvent{}

class UpdateTaskEvent extends TaskEvent{}

class DeleteTaskEvent extends TaskEvent{
  final int id;
  DeleteTaskEvent({required this.id});
}