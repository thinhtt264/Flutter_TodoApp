import 'package:equatable/equatable.dart';

enum AlertDialogType { noti, action, normal }

class AlertDialogProps extends Equatable {
  final bool isVisible;
  final String title;
  final String content;
  final AlertDialogType type;

  const AlertDialogProps({
    this.title = 'Notification',
    this.isVisible = true,
    this.content = 'OK',
    this.type = AlertDialogType.noti,
  });

  AlertDialogProps copyWith({
    String? title,
    String? content,
    bool? isVisible,
    AlertDialogType? type,
  }) {
    return AlertDialogProps(
      title: title ?? this.title,
      content: content ?? this.content,
      isVisible: isVisible ?? this.isVisible,
      type: type ?? this.type,
    );
  }

  @override
  List<Object?> get props => [isVisible];
}