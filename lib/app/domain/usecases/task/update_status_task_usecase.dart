import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_list_app/app/core/exceptions/failure.dart';
import 'package:todo_list_app/app/domain/entities/task_entity.dart';
import 'package:todo_list_app/app/domain/repositories/task_repository.dart';

import '../../../core/generics/usecase/usecase.dart';

class UpdateStatusTaskUsecase implements UseCase<void, Params> {
  final TaskRepository taskRepository;
  UpdateStatusTaskUsecase({
    required this.taskRepository,
  });

  @override
  Future<Either<Failure, void>> call(Params params) async {
    return taskRepository.updateStatusTask(task: params.task);
  }
}

class Params extends Equatable {
  final TaskEntity task;

  const Params({required this.task});

  @override
  List<Object> get props => [task];
}
