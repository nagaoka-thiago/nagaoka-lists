import 'package:flutter_test/flutter_test.dart';
import 'package:nagaoka_lists/src/core/adapters/database/data/use_cases/add_item_usecase_impl.dart';
import 'package:nagaoka_lists/src/core/adapters/database/domain/entities/item_entity.dart';
import 'package:nagaoka_lists/src/core/adapters/database/domain/entities/list_entity.dart';
import 'package:nagaoka_lists/src/core/adapters/database/domain/repositories/database_client_repository.dart';
import 'package:nagaoka_lists/src/core/errors/error_exception.dart';
import 'package:nagaoka_lists/src/core/generics/resource.dart';

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
