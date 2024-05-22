import 'package:flutter_test/flutter_test.dart';
import 'package:nagaoka_lists/src/core/adapters/database/data/use_cases/delete_item_usecase_impl.dart';
import 'package:nagaoka_lists/src/core/adapters/database/domain/entities/item_entity.dart';
import 'package:nagaoka_lists/src/core/adapters/database/domain/entities/list_entity.dart';
import 'package:nagaoka_lists/src/core/adapters/database/domain/repositories/database_client_repository.dart';
import 'package:nagaoka_lists/src/core/errors/error_exception.dart';
import 'package:nagaoka_lists/src/core/generics/resource.dart';

void main() async {
  group('Delete Item Usecase tests', () {
    final sut = DeleteItemUsecaseImpl();

    test(
        "When items parameter is not empty and index is inside items list range, it should remove a item from its items",
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
      final result = await sut.call(index: 0, items: items);
      //Then
      expect(result.data, isNotNull);
      expect(result.data, isA<int>());
      expect(items.length, equals(1));
    }));
    test("When items parameter is empty, it should return error exception",
        (() async {
      //Given
      final items = <ItemEntity>[];
      //When
      final result = await sut.call(index: 0, items: items);
      //Then
      expect(result.data, isNull);
      expect(result.error, isNotNull);
      expect(items.length, equals(0));
    }));
    test(
        "When items parameter is not empty, but index is out of range, it should return error exception",
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
      final result = await sut.call(index: 2, items: items);
      //Then
      expect(result.data, isNull);
      expect(result.error, isNotNull);
      expect(items.length, equals(2));
    }));
  });
}

class DatabaseClientRepositoryStub implements DatabaseClientRepository {
  late Resource<int, ErrorException> returnedUpdateDeleteAdd;
  late Resource<ListEntity, ErrorException> returnedRead;
  late Resource<List<ListEntity>, ErrorException> returnedReads;
  @override
  Future<Resource<int, ErrorException>> addList(
      {required ListEntity list}) async {
    return returnedUpdateDeleteAdd;
  }

  @override
  Future<Resource<int, ErrorException>> deleteList(
      {required String title}) async {
    return returnedUpdateDeleteAdd;
  }

  @override
  Future<Resource<ListEntity, ErrorException>> readList(
      {required String title}) async {
    return returnedRead;
  }

  @override
  Future<Resource<List<ListEntity>, ErrorException>> readLists() async {
    return returnedReads;
  }

  @override
  Future<Resource<int, ErrorException>> updateList(
      {required String title, required ListEntity list}) async {
    return returnedUpdateDeleteAdd;
  }
}
