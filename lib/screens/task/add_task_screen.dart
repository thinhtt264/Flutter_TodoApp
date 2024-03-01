import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/blocs/app_bloc/app_bloc.dart';
import 'package:flutter_application_1/blocs/task_bloc/task_bloc.dart';
import 'package:flutter_application_1/data/data.dart';
import 'package:flutter_application_1/screens/task/widget/widget.dart';
import 'package:flutter_application_1/widget/custom_button.dart';
import 'package:flutter_application_1/widget/widgets.dart';
import 'package:bottom_picker/bottom_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTaskScreen> {
  late DateTime _date;
  late DateTime _time;
  String _title = '';
  String _description = '';

  @override
  void initState() {
    super.initState();
    _date = DateTime.now();
    _time = DateTime.now();
  }

  void _openPicker(BuildContext context, BottomPickerType type) {
    BottomPicker picker;

    TextStyle pickerTextStyle = const TextStyle(
      color: Colors.blue,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    );

    TextStyle titleStyle = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: Colors.blue,
    );

    Widget buttonContent = const Text(
      'Submit',
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.white, fontSize: 15),
    );

    if (type == BottomPickerType.time) {
      picker = BottomPicker.time(
        title: 'Choose Task Time',
        pickerTextStyle: pickerTextStyle,
        titleAlignment: CrossAxisAlignment.center,
        titleStyle: titleStyle,
        displaySubmitButton: true,
        buttonContent: buttonContent,
        buttonPadding: 10,
        onSubmit: (index) {
          setState(() {
            _date = index;
          });
        },
        dismissable: true,
        bottomPickerTheme: BottomPickerTheme.plumPlate,
        initialTime: Time.now(),
      );
    } else {
      picker = BottomPicker.date(
        title: 'Choose Task Date',
        dateOrder: DatePickerDateOrder.dmy,
        minDateTime: DateTime.now(),
        pickerTextStyle: pickerTextStyle,
        titleAlignment: CrossAxisAlignment.center,
        titleStyle: titleStyle,
        displaySubmitButton: true,
        buttonContent: buttonContent,
        buttonPadding: 10,
        onSubmit: (index) {
          setState(() {
            _date = index;
          });
        },
        dismissable: true,
        bottomPickerTheme: BottomPickerTheme.plumPlate,
      );
    }

    picker.show(context);
  }

  onChangeDescription(String value) {
    setState(() {
      _description = value;
    });
  }

  onChangeTitle(String value) {
    setState(() {
      _title = value;
    });
  }

  _onAddNewTask(BuildContext context) {
    if (_title.isEmpty || _description.isEmpty) {
      context.read<AppBloc>().add(
            const OpenDialogEvent(
              dialogProps: AlertDialogProps(
                title: 'Notification',
                content: 'Please enter title and description',
                type: AlertDialogType.noti,
              ),
            ),
          );
      return;
    }
    context.read<TaskBloc>().add(AddTaskEvent(
            task: Task(
          id: DateTime.now().millisecondsSinceEpoch.toInt(),
          title: _title,
          description: _description,
          date: '2022-01-01',
          time: '10:00',
          isCompleted: false,
        )));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: const MyAppBar(),
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration:
                BoxDecoration(color: Theme.of(context).colorScheme.background),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Title(),
                  InputTitleTask(onChangeTextValue: onChangeTitle),
                  const SizedBox(height: 20),
                  InputDesTask(onChangeTextValue: onChangeDescription),
                  const SizedBox(height: 20),
                  TaskDateTime(
                    title: 'Time',
                    type: BottomPickerType.time,
                    openPicker: (type) => _openPicker(context, type),
                    date: _time,
                  ),
                  TaskDateTime(
                    title: 'Date',
                    type: BottomPickerType.dateTime,
                    date: _date,
                    openPicker: (type) => _openPicker(context, type),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomButton(
                      borderRadius: 16,
                      customPadding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 34),
                      text: 'Confirm',
                      onPressed: () {
                        _onAddNewTask(context);
                      }),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

class InputDesTask extends StatelessWidget {
  const InputDesTask({super.key, required this.onChangeTextValue});

  final Function(String) onChangeTextValue;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text('Task Description: ')),
          TextField(
            onChanged: (value) => onChangeTextValue(value),
            maxLines: 6,
            cursorColor: Colors.black,
            style: TextField.materialMisspelledTextStyle,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.all(12.0),
                filled: true,
                fillColor: Colors.white),
          ),
        ]);
  }
}

class InputTitleTask extends StatelessWidget {
  const InputTitleTask({super.key, required this.onChangeTextValue});
  final Function(String) onChangeTextValue;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) => onChangeTextValue(value),
      maxLines: 1,
      cursorColor: Colors.black,
      decoration: InputDecoration(
          hintText: 'Task Title:',
          prefixIcon: const Icon(Icons.title),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
          filled: true,
          fillColor: Colors.white),
    );
  }
}

class Title extends StatelessWidget {
  const Title({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              height: 0.5,
              color: Colors.black54,
            ),
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Add New Task',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 0.5,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
