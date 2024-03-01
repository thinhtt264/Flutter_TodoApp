import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/utils.dart';

class TaskDateTime extends StatelessWidget {
  final String title;
  final BottomPickerType type;
  final DateTime date;
  final Function(BottomPickerType type) openPicker;
  const TaskDateTime(
      {super.key,
      required this.title,
      required this.type,
      required this.openPicker,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white),
          child: InkWell(
            onTap: () => openPicker(type),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(color: Colors.grey.shade700),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                      color: Colors.grey.shade200),
                  child: Text(
                    type == BottomPickerType.dateTime
                        ? formatDate(date)
                        : formatTime(date),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
