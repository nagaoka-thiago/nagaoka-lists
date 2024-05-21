import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';
import 'package:nagaoka_lists/src/app_module.dart';
import 'package:nagaoka_lists/src/core/adapters/database/data/use_cases/read_lists_usecase_impl.dart';
import 'package:nagaoka_lists/src/core/adapters/database/domain/entities/item_entity.dart';
import 'package:nagaoka_lists/src/core/adapters/database/domain/entities/list_entity.dart';
import 'package:nagaoka_lists/src/core/adapters/database/domain/repositories/database_client_repository.dart';
import 'package:nagaoka_lists/src/core/errors/error_exception.dart';
import 'package:nagaoka_lists/src/core/generics/resource.dart';

void main() async {
  final firestoreStub = FakeFirebaseFirestore();
  final repositoryStub = DatabaseClientRepositoryStub();
  group('Read Lists Usecase tests', () {
    initModule(AppModule(), replaceBinds: [
      Bind.instance<FirebaseFirestore>(firestoreStub),
      Bind.instance<DatabaseClientRepository>(repositoryStub)
    ]);
    final sut = ReadListsUsecaseImpl();

    test("When readLists success, it returns a list of maps", (() async {
      //Given
      repositoryStub.returnedReads = Resource.success(data: [
        ListEntity(title: 'Title 1', items: [
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
        ]),
        ListEntity(title: 'Title 2', items: [
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
        ]),
      ]);
      //When
      final result = await sut.call();
      //Then
      expect(result.error, isNull);
      expect(result.data, isNotNull);
      expect(result.data, isA<List>());
      expect(result.data!.length, equals(2));
    }));
    test("When readLists fails, it returns an ErrorException", (() async {
      //Given
      final dummyError = 'dummyError';
      repositoryStub.returnedReads =
          Resource.failed(error: ErrorException(message: dummyError));
      //When
      final result = await sut.call();
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
