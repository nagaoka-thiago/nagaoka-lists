import 'package:nagaoka_lists/src/core/adapters/database/domain/entities/item_entity.dart';
import 'package:nagaoka_lists/src/core/adapters/database/domain/use_cases/add_item_usecase.dart';
import 'package:nagaoka_lists/src/core/errors/error_exception.dart';
import 'package:nagaoka_lists/src/core/generics/resource.dart';

class AddItemUsecaseImpl implements AddItemUsecase {
  @override
  Future<Resource<int, ErrorException>> call(
      {required List<ItemEntity> items}) async {
    items.add(ItemEntity(
        title: '',
        description: '',
        createdAt: DateTime.now(),
        changedAt: DateTime.now()));

    return Resource.success(data: 1);
  }
}
