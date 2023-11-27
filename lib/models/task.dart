import 'package:hive/hive.dart';
part 'task.g.dart';

@HiveType(typeId: 1)
class Task {
  @HiveField(0)
  String title;

  @HiveField(1)
  String description;

  @HiveField(2)
  String status;

  @HiveField(3)
  String assignee;

  Task(
      {required this.title,
      required this.description,
      required this.status,
      required this.assignee});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      status: json['status'] ?? '',
      assignee: json['assignee'] ?? '',
    );
  }
}
