import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/blocs/blocs.dart';
import 'package:flutter_application_1/data/data.dart';
import 'package:flutter_application_1/screens/home/widget/widget.dart';
import 'package:flutter_application_1/screens/task/add_task_screen.dart';
import 'package:flutter_application_1/services/service.dart';
import 'package:flutter_application_1/widget/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final db = DatabaseService();
  final TextEditingController _controller = TextEditingController();
  late String _searchText = '';
  late List<Task> filteredTasks = [];

  void filterTasks(List<Task> tasks) {
    filteredTasks.clear();
    if (_searchText.isEmpty) {
      filteredTasks.addAll(tasks);
    } else {
      filteredTasks.addAll(tasks.where((task) =>
          task.title!.toLowerCase().contains(_searchText.toLowerCase())));
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    db.close();
  }

  onPressAddTask(BuildContext context) {
    Navigator.of(context).push(
        CupertinoPageRoute(builder: ((context) => const AddTaskScreen())));
  }

  onPressDeleteTask(BuildContext context, Task task) {
    context.read<TaskBloc>().add(DeleteTaskEvent(task: task));
  }

  onCheckCompleteTask(BuildContext context, int id, bool isCompleted) {
    context
        .read<TaskBloc>()
        .add(CompleteTaskEvent(isCompleted: isCompleted, id: id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TaskBloc, TaskState>(listener: (context, state) {
      if (state.tasks.isNotEmpty) {
        filterTasks(state.tasks);
      }
    }, child: Scaffold(
        body: BlocBuilder<TaskBloc, TaskState>(builder: (context, state) {
      return SafeArea(
          child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Flutter Todo App',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SearchBox(
                  controller: _controller,
                  onChanged: (value) {
                    setState(() {
                      _searchText = value;
                      filterTasks(state.tasks);
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: DisplayListOfTasks(
                    isCompletedTasks: false,
                    tasks: filteredTasks,
                    itemBuilder: (task) {
                      return CustomTaskItem(
                        key: ValueKey(task.id),
                        onPressDelete: () => onPressDeleteTask(context, task),
                        onCheckComplete: (isCompleted) =>
                            onCheckCompleteTask(context, task.id, isCompleted),
                        task: task,
                      );
                    },
                  ),
                ),
              ],
            ),
            Positioned(
              right: 20,
              bottom: 20,
              child: InkWell(
                onTap: () => onPressAddTask(context),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ));
    })));
  }
}
