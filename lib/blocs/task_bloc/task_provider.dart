import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/blocs/task_bloc/task_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskProvider extends StatelessWidget {
  final Widget child;

  const TaskProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => TaskBloc(), child: child);
  }
}
