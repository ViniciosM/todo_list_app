import 'package:equatable/equatable.dart';
import 'package:todo_list_app/app/core/exceptions/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:todo_list_app/app/core/generics/usecase/usecase.dart';
import 'package:todo_list_app/app/domain/entities/task_entity.dart';

import '../../repositories/task_repository.dart';

class CreateTaskUsecase implements UseCase<void, Params> {
  final TaskRepository taskRepository;

  CreateTaskUsecase({required this.taskRepository});

  @override
  Future<Either<Failure, void>> call(Params params) {
    return taskRepository.createTask(task: params.task);
  }
}

class Params extends Equatable {
  final TaskEntity task;

  const Params({required this.task});

  @override
  List<Object> get props => [task];
}
