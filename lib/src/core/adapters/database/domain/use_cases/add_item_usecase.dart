import 'package:nagaoka_lists/src/core/adapters/database/domain/entities/item_entity.dart';
import 'package:nagaoka_lists/src/core/errors/error_exception.dart';
import 'package:nagaoka_lists/src/core/generics/resource.dart';

abstract class AddItemUsecase {
  Future<Resource<int, ErrorException>> call({required List<ItemEntity> items});
}
