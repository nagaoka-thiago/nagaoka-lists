import 'package:nagaoka_lists/src/core/adapters/database/domain/entities/item_entity.dart';
import 'package:nagaoka_lists/src/core/adapters/database/domain/use_cases/delete_item_usecase.dart';
import 'package:nagaoka_lists/src/core/errors/error_exception.dart';
import 'package:nagaoka_lists/src/core/generics/resource.dart';

class DeleteItemUsecaseImpl implements DeleteItemUsecase {
  @override
  Future<Resource<int, ErrorException>> call(
      {required List<ItemEntity> items, required int index}) async {
    if (items.isNotEmpty) {
      if (index < items.length) {
        items.removeAt(index);

        return Resource.success(data: 1);
      } else {
        return Resource.failed(
            error: ErrorException(
                message:
                    'The index is out of range of item\'s list\'s length!'));
      }
    }

    return Resource.failed(
        error: ErrorException(message: 'The item\'s list is empty!'));
  }
}
