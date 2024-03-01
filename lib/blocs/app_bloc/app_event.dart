part of 'app_bloc.dart';

@immutable
abstract class AppEvent {
  const AppEvent();
}

class AppStartedEvent extends AppEvent {}

class OpenDialogEvent extends AppEvent {
  const OpenDialogEvent({required this.dialogProps});
  final AlertDialogProps dialogProps;
}

class CloseDialogEvent extends AppEvent {}
