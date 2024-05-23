import 'package:flutter_test/flutter_test.dart';
import 'package:nagaoka_lists/src/core/adapters/database/data/use_cases/add_item_usecase_impl.dart';
import 'package:nagaoka_lists/src/core/adapters/database/domain/entities/item_entity.dart';

void main() async {
  group('Add Item Usecase tests', () {
    final sut = AddItemUsecaseImpl();

    test("When items parameter is not empty, it should add a item to its items",
        (() async {
      //Given
      final items = <ItemEntity>[
        ItemEntity(
            title: '',
            description: '',
            createdAt: DateTime.now(),
            changedAt: DateTime.now()),
        ItemEntity(
            title: '',
            description: '',
            createdAt: DateTime.now(),
            changedAt: DateTime.now()),
      ];
      //When
      final result = await sut.call(items: items);
      //Then
      expect(result.data, isNotNull);
      expect(result.data, isA<int>());
      expect(items.length, equals(3));
    }));
  });
}
