part of 'home_controller.dart';

enum HomeStatus { initial, loading, complete, failure }

class HomeState extends Equatable {
  final List<TaskModel> tasks;
  final HomeStatus status;
  final TaskStatus taskStatus;

  const HomeState._(
      {required this.tasks, required this.status, required this.taskStatus});

  HomeState.initial()
      : this._(
            tasks: [],
            status: HomeStatus.initial,
            taskStatus: TaskStatus.pending);

  @override
  List<Object?> get props => [tasks, status, taskStatus];

  HomeState copyWith({
    List<TaskModel>? tasks,
    HomeStatus? status,
    TaskStatus? taskStatus,
  }) {
    return HomeState._(
      tasks: tasks ?? this.tasks,
      status: status ?? this.status,
      taskStatus: taskStatus ?? this.taskStatus,
    );
  }
}
