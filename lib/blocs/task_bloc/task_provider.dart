part of 'task_bloc.dart';
class TaskProvider extends StatelessWidget {
  final Widget child;

  const TaskProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TaskBloc>(
        create: (BuildContext context) => TaskBloc()..add(GetAllTasksEvent()),
        child: child);
  }
}
