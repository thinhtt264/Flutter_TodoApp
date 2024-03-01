import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/blocs/blocs.dart';
import 'package:flutter_application_1/screens/screens.dart';
import 'package:flutter_application_1/widget/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    return MultiBlocProvider(
      providers: [
        BlocProvider<TaskBloc>(
          create: (BuildContext context) => TaskBloc()..add(GetAllTasksEvent()),
        ),
        BlocProvider<AppBloc>(
          create: (BuildContext context) => AppBloc(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: const ColorScheme.light(
              background: Color(0xFFEEEFF5),
              onBackground: Colors.black,
              primary: Colors.yellow,
              onPrimary: Colors.black,
              secondary: Colors.greenAccent,
              onSecondary: Colors.white),
          useMaterial3: true,
        ),
        home: const RootWidget(),
      ),
    );
  }
}

class RootWidget extends StatelessWidget {
  const RootWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AppBloc, AppState>(
          listener: (context, state) {
            if (state.dialogProps?.isVisible == true) {
              CustomAlertDialog.notification(
                context,
                state.dialogProps!.title,
                state.dialogProps!.content,
                state.dialogProps!.type,
              );
            }
          },
        ),
      ],
      child: const HomeScreen(), // Your widget content here
    );
  }
}
