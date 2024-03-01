import 'package:flutter/material.dart';
import 'package:flutter_application_1/blocs/blocs.dart';
import 'package:flutter_application_1/data/data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum DialogAction { ok, cancel, yes, no }

class CustomAlertDialog {
  static Future notification(
    BuildContext context,
    String title,
    String content,
    AlertDialogType type,
  ) {
    void onHiding(BuildContext context) {
      context.read<AppBloc>().add(CloseDialogEvent());
    }

    return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              elevation: 1,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              title: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.transparent,
              actions: <Widget>[
                Center(
                  child: TextButton(
                      onPressed: () {
                        onHiding(context);
                        Navigator.of(context).pop(DialogAction.ok);
                      },
                      child: Text(
                        content,
                        textAlign: TextAlign.center,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 15),
                      )),
                )
              ],
            )).then((value) => onHiding(context));
  }
}
