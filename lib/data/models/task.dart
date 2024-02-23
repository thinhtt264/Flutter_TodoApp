import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final int? id;
  final String? title;
  final String? description;
  final bool? isCompleted;
  final String? date;
  final String? time;

  const Task(
      {this.id,
      this.title,
      this.description,
      this.isCompleted,
      this.date,
      this.time});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'time': time,
      'date': date,
      'isCompleted': isCompleted ?? false,
    };
  }

Task copyWith({
    int? id,
    String? title,
    String? description,
    bool? isCompleted,
    String? date,
    String? time,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      date: date ?? this.date,
      time: time ?? this.time,
    );
  }

  @override
  List<Object?> get props {
    return [id, title, description, isCompleted, date, time];
  }
}
