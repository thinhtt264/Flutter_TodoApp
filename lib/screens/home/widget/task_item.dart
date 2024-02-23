import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/data.dart';

class CustomTaskItem extends StatelessWidget {
  final Task task;

  const CustomTaskItem({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black26,
          width: 1,
          style: BorderStyle.solid,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Center(
        child: Text(
          task.title ?? '',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
