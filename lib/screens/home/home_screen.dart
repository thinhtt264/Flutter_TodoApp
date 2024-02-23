import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/data.dart';
import 'package:flutter_application_1/screens/home/widget/widget.dart';
import 'package:flutter_application_1/widget/widgets.dart';

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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: SafeArea(
            child: Column(
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
                      tasks: filteredTasks,
                      itemBuilder: (task) {
                        return CustomTaskItem(
                          task: task,
                        );
                      }),
                ),
              ],
            ),
          ),
        ));
  }
}
