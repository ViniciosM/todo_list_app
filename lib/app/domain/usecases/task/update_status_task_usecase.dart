import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_list_app/app/core/exceptions/failure.dart';
import 'package:todo_list_app/app/domain/entities/task_status.dart';
import 'package:todo_list_app/app/domain/repositories/task_repository.dart';

import '../../../core/generics/usecase/usecase.dart';

class UpdateStatusTaskUsecase implements UseCase<void, Params> {
  final TaskRepository taskRepository;
  UpdateStatusTaskUsecase({
    required this.taskRepository,
  });

  @override
  Future<Either<Failure, void>> call(Params params) async {
    return taskRepository.filterByStatusTask(status: params.status);
  }
}

class Params extends Equatable {
  final TaskStatus status;

  const Params({required this.status});

  @override
  List<Object> get props => [status];
}
