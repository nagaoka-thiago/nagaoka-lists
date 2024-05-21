import 'package:nagaoka_lists/src/core/errors/error_exception.dart';
import 'package:nagaoka_lists/src/core/generics/resource.dart';

abstract class DeleteListUsecase {
  Future<Resource<int, ErrorException>> call({required String title});
}
