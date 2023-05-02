import 'package:todo_list_app/app/core/state/result_wrapper.dart';

abstract class DeleteTaskUsecase {
  Future<Result<void>> call({required int id});
}
