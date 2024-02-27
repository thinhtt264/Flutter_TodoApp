import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/data.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CustomTaskItem extends StatelessWidget {
  final Task task;
  final Function(bool isCompleted) onCheckComplete;
  final Function onPressDelete;

  const CustomTaskItem(
      {Key? key,
      required this.task,
      required this.onCheckComplete,
      required this.onPressDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      color: Theme.of(context).colorScheme.primary,
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Slidable(
          startActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                autoClose: true,
                onPressed: (_) {
                  onPressDelete();
                },
                backgroundColor: const Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
              SlidableAction(
                autoClose: true,
                onPressed: (_) {},
                backgroundColor: Colors.blueAccent.shade200,
                foregroundColor: Colors.white,
                icon: Icons.share,
                label: 'Delete',
              ),
            ],
          ),
          child: ListTile(
            title: Text(task.title ?? ''),
            subtitle: Text(task.description ?? ''),
            trailing: Checkbox(
              value: task.isCompleted ?? false,
              activeColor: Theme.of(context).colorScheme.secondary,
              onChanged: (value) {
                onCheckComplete(value ?? false);
              },
            ),
          )),
    );
  }
}
