import 'package:flutter_application_1/blocs/task_bloc/task_event.dart';
import 'package:flutter_application_1/data/data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskBloc extends Bloc<TaskEvent, List<Task>> {
  TaskBloc()
      : super([
          const Task(
            title: 'task 1',
            description: '123',
            date: '2022-01-01',
            time: '10:00',
            isCompleted: false,
          )
        ]) {
    on<AddTaskEvent>((event, emit) => _addEvent);
  }

  void _addEvent(AddTaskEvent event, Emitter emit) {
    print('zo chưa');
    emit(state copyWith);
  }
}
