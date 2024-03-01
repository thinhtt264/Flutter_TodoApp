part of 'app_bloc.dart';

class AppState extends Equatable {
  const AppState({this.dialogProps}) : super();

  final AlertDialogProps? dialogProps;

  AppState copyWith({AlertDialogProps? dialogProps}) {
    return AppState(dialogProps: dialogProps ?? this.dialogProps);
  }

  @override
  List<Object?> get props => [dialogProps];
}
