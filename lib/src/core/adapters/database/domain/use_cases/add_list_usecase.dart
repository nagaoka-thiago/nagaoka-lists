import 'package:nagaoka_lists/src/core/adapters/database/domain/entities/list_entity.dart';
import 'package:nagaoka_lists/src/core/errors/error_exception.dart';
import 'package:nagaoka_lists/src/core/generics/resource.dart';

abstract class AddListUsecase {
  Future<Resource<int, ErrorException>> call({required ListEntity list});
}
