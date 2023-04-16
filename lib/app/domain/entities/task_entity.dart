import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  final String? id;
  final String title;
  final bool isDone;

  const TaskEntity({this.id, required this.title, required this.isDone});

  @override
  List<Object> get props => [title, isDone];
}
