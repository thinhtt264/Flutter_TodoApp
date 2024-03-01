import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState()) {
    on<OpenDialogEvent>((event, emit) => _showAlertDiaglog(event, emit));
    on<CloseDialogEvent>((event, emit) => _closeAlertDialog(event, emit));
  }

  _showAlertDiaglog(OpenDialogEvent event, Emitter<AppState> emit) {
    emit(state.copyWith(dialogProps: event.dialogProps));
  }

  _closeAlertDialog(CloseDialogEvent event, Emitter<AppState> emit) {
    emit(state.copyWith(dialogProps:const AlertDialogProps(isVisible: false)));
  }
}
