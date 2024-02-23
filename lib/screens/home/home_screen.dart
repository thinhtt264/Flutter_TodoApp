import 'package:flutter/material.dart';
import 'package:flutter_application_1/blocs/blocs.dart';
import 'package:flutter_application_1/data/data.dart';
import 'package:flutter_application_1/screens/home/widget/widget.dart';
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
  final TextEditingController _controller = TextEditingController();
  late String _searchText = '';
  late List<Task> filteredTasks = [];

  final List<Task> tasks = [
    const Task(
        id: 1,
        title: 'Task 1',
        description: 'Description 1',
        isCompleted: false,
        date: '2022-01-01',
        time: '10:00'),
    const Task(
        id: 2,
        title: 'Task 2',
        description: 'Description 2',
        isCompleted: true,
        date: '2022-01-01',
        time: '10:00'),
    const Task(
        id: 3,
        title: 'Task 3',
        description: 'Description 2',
        isCompleted: true,
        date: '2022-01-01',
        time: '10:00'),
  ];

  void filterTasks() {
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
    filterTasks();
  }

  onPressAddTask(BuildContext context) {
    context.read<TaskBloc>().add(AddTaskEvent());
    print('vcc');
  }

  @override
  Widget build(BuildContext context) {
    return TaskProvider(
      child: Scaffold(
          body: BlocBuilder<TaskBloc, List<Task>>(builder: (context, state) {
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
                        filterTasks();
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: DisplayListOfTasks(
                      isCompletedTasks: false,
                      tasks: state,
                      itemBuilder: (task) {
                        return CustomTaskItem(
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
      })),
    );
  }
}
