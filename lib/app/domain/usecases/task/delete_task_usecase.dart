import 'package:equatable/equatable.dart';
import 'package:todo_list_app/app/core/exceptions/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:todo_list_app/app/core/generics/usecase/usecase.dart';
import 'package:todo_list_app/app/domain/repositories/task_repository.dart';

class DeleteTaskUsecase implements UseCase<void, Params> {
  final TaskRepository taskRepository;

  DeleteTaskUsecase({required this.taskRepository});

  @override
  Future<Either<Failure, void>> call(Params params) async {
    return taskRepository.deleteTask(idTask: params.idTask);
  }
}

class Params extends Equatable {
  final String idTask;

  const Params({required this.idTask});

  @override
  List<Object> get props => [idTask];
}
