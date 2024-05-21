import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';
import 'package:nagaoka_lists/src/app_module.dart';
import 'package:nagaoka_lists/src/core/adapters/database/data/use_cases/add_list_usecase_impl.dart';
import 'package:nagaoka_lists/src/core/adapters/database/domain/entities/item_entity.dart';
import 'package:nagaoka_lists/src/core/adapters/database/domain/entities/list_entity.dart';
import 'package:nagaoka_lists/src/core/adapters/database/domain/repositories/database_client_repository.dart';
import 'package:nagaoka_lists/src/core/errors/error_exception.dart';
import 'package:nagaoka_lists/src/core/generics/resource.dart';

void main() async {
  final firestoreStub = FakeFirebaseFirestore();
  final repositoryStub = DatabaseClientRepositoryStub();
  group('Add List Usecase tests', () {
    initModule(AppModule(), replaceBinds: [
      Bind.instance<FirebaseFirestore>(firestoreStub),
      Bind.instance<DatabaseClientRepository>(repositoryStub)
    ]);
    final sut = AddListUsecaseImpl();

    test("When addList success, it returns a list of maps", (() async {
      //Given
      repositoryStub.returnedUpdateDeleteAdd = Resource.success(
        data: 1,
      );
      //When
      final result = await sut.call(
          list: ListEntity(title: 'Title 1', items: [
        ItemEntity(
          title: 'Item 1',
          description: 'Description 1',
          createdAt: DateTime(2024, 5, 19),
          changedAt: DateTime(2024, 5, 19),
        ),
        ItemEntity(
          title: 'Item 2',
          description: 'Description 2',
          createdAt: DateTime(2024, 5, 19),
          changedAt: DateTime(2024, 5, 19),
        ),
      ]));
      //Then
      expect(result.error, isNull);
      expect(result.data, isNotNull);
      expect(result.data, isA<int>());
      expect(result.data, equals(1));
    }));
    test("When addList fails, it returns an ErrorException", (() async {
      //Given
      final dummyError = 'dummyError';
      repositoryStub.returnedUpdateDeleteAdd =
          Resource.failed(error: ErrorException(message: dummyError));
      //When
      final result = await sut.call(
          list: ListEntity(title: 'Title 1', items: [
        ItemEntity(
          title: 'Item 1',
          description: 'Description 1',
          createdAt: DateTime(2024, 5, 19),
          changedAt: DateTime(2024, 5, 19),
        ),
        ItemEntity(
          title: 'Item 2',
          description: 'Description 2',
          createdAt: DateTime(2024, 5, 19),
          changedAt: DateTime(2024, 5, 19),
        ),
      ]));
      //Then
      expect(result.error, isNotNull);
      expect(result.data, isNull);
      expect(result.error, isA<ErrorException>());
      expect(result.error!.message, equals(dummyError));
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
