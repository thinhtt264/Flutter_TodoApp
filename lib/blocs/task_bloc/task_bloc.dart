import 'package:flutter_application_1/blocs/task_bloc/task_event.dart';
import 'package:flutter_application_1/data/data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskBloc extends Bloc<TaskEvent, Task> {
  TaskBloc() : super(const Task()) {
      on<AddTaskEvent>((event, emit) => )
  }

 Future<void> _addEvent(Emitter emit) async {
    emit.call(state)
  }
}
