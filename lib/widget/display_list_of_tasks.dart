import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/data.dart';
import 'package:flutter_application_1/utils/utils.dart';
import 'package:flutter_application_1/widget/widgets.dart';

class DisplayListOfTasks extends StatelessWidget {
  final bool isCompletedTasks;
  final List<Task> tasks;
  final Widget Function(Task) itemBuilder;
  final Widget? divider;
  final void Function(Task)? onTapItem;

  const DisplayListOfTasks({
    super.key,
    this.isCompletedTasks = false,
    this.onTapItem,
    required this.itemBuilder,
    this.divider,
    required this.tasks,
  });

  @override
  Widget build(BuildContext context) {
    final deviceSize = context.deviceSize;
    final height =
        isCompletedTasks ? deviceSize.height * 0.25 : deviceSize.height * 0.3;
    final emptyTasksAlert = isCompletedTasks
        ? 'There is no completed task yet'
        : 'There is no task to todo!';

    return CommonContainer(
      height: height,
      child: tasks.isEmpty
          ? Center(
              child: Container(
              margin: const EdgeInsets.only(bottom: 40),
              child: Text(
                emptyTasksAlert,
                style: context.textTheme.headlineSmall,
              ),
            ))
          : ListView.separated(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              shrinkWrap: true,
              itemCount: tasks.length + 1,
              padding: EdgeInsets.zero,
              itemBuilder: (ctx, index) {
                if (index == tasks.length) {
                  return const SizedBox(
                    height: 20,
                  );
                }
                final task = tasks[index];

                return InkWell(
                    onLongPress: () async {},
                    onTap: () async {
                      // onTapItem!(task);
                    },
                    child: itemBuilder(task));
              },
              separatorBuilder: (context, index) =>
                  divider ??
                  Divider(
                    key: UniqueKey(),
                    color: Colors.transparent,
                    height: 15,
                  ),
            ),
    );
  }
}
