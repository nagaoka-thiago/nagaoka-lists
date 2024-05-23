import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';
import 'package:nagaoka_lists/src/app_module.dart';
import 'package:nagaoka_lists/src/core/adapters/database/data/repositories/database_client_repository_impl.dart';
import 'package:nagaoka_lists/src/core/adapters/database/domain/data_sources/database_client_data_source.dart';
import 'package:nagaoka_lists/src/core/adapters/database/domain/entities/item_entity.dart';
import 'package:nagaoka_lists/src/core/adapters/database/domain/entities/list_entity.dart';
import 'package:nagaoka_lists/src/core/errors/error_exception.dart';
import 'package:nagaoka_lists/src/core/generics/resource.dart';

void main() async {
  final firestoreStub = FakeFirebaseFirestore();
  final datasourceStub = DatabaseClientDataSourceStub();
  group('Database Client Repository tests', () {
    initModule(AppModule(), replaceBinds: [
      Bind.instance<FirebaseFirestore>(firestoreStub),
      Bind.instance<DatabaseClientDataSource>(datasourceStub)
    ]);
    final sut = DatabaseClientRepositoryImpl();

    test("When readLists success, it returns a list of maps", (() async {
      //Given
      datasourceStub.returnedReads = Resource.success(data: [
        {
          'title': 'Title 1',
          'items': [
            {
              'title': 'Item 1',
              'description': 'Description 1',
              'created_at': '19/05/2024 00:00:00',
              'changed_at': '19/05/2024 00:00:00',
            },
            {
              'title': 'Item 2',
              'description': 'Description 2',
              'created_at': '19/05/2024 00:00:00',
              'changed_at': '19/05/2024 00:00:00',
            },
          ]
        },
        {
          'title': 'Title 2',
          'items': [
            {
              'title': 'Item 1',
              'description': 'Description 1',
              'created_at': '19/05/2024 00:00:00',
              'changed_at': '19/05/2024 00:00:00',
            },
            {
              'title': 'Item 2',
              'description': 'Description 2',
              'created_at': '19/05/2024 00:00:00',
              'changed_at': '19/05/2024 00:00:00',
            },
          ]
        },
      ]);
      //When
      final result = await sut.readLists();
      //Then
      expect(result.error, isNull);
      expect(result.data, isNotNull);
      expect(result.data, isA<List>());
      expect(result.data!.length, equals(2));
    }));
    test("When readLists fails, it returns an ErrorException", (() async {
      //Given
      const dummyError = 'dummyError';
      datasourceStub.returnedReads =
          Resource.failed(error: ErrorException(message: dummyError));
      //When
      final result = await sut.readLists();
      //Then
      expect(result.error, isNotNull);
      expect(result.data, isNull);
      expect(result.error, isA<ErrorException>());
      expect(result.error!.message, equals(dummyError));
    }));
    test("When readList success, it returns a map", (() async {
      //Given
      const dummyString = 'Title 1';
      datasourceStub.returnedRead = Resource.success(data: {
        'title': 'Title 1',
        'items': [
          {
            'title': 'Item 1',
            'description': 'Description 1',
            'created_at': '19/05/2024 00:00:00',
            'changed_at': '19/05/2024 00:00:00',
          },
          {
            'title': 'Item 2',
            'description': 'Description 2',
            'created_at': '19/05/2024 00:00:00',
            'changed_at': '19/05/2024 00:00:00',
          },
        ]
      });
      //When
      final result = await sut.readList(title: dummyString);
      //Then
      expect(result.error, isNull);
      expect(result.data, isNotNull);
      expect(result.data, isA<ListEntity>());
      expect(result.data!.title, equals(dummyString));
    }));
    test("When readList fails, it returns an ErrorException", (() async {
      //Given
      const dummyError = 'dummyError';
      const dummyString = 'Title 1';
      datasourceStub.returnedRead =
          Resource.failed(error: ErrorException(message: dummyError));
      //When
      final result = await sut.readList(title: dummyString);
      //Then
      expect(result.error, isNotNull);
      expect(result.data, isNull);
      expect(result.error, isA<ErrorException>());
      expect(result.error!.message, equals(dummyError));
    }));
    test("When addList success, it returns 1", (() async {
      //Given
      datasourceStub.returnedUpdateDeleteAdd = Resource.success(data: 1);
      //When
      final result = await sut.addList(
          list: ListEntity(title: 'Title 1', items: [
        ItemEntity(
          title: 'Item 1',
          description: 'Description 1',
          createdAt: DateTime(2024, 5, 19, 0, 0, 0),
          changedAt: DateTime(2024, 5, 19, 0, 0, 0),
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
      expect(result.data!, equals(1));
    }));
    test("When addList fails, it returns an ErrorException", (() async {
      //Given
      const dummyError = 'dummyError';
      datasourceStub.returnedUpdateDeleteAdd =
          Resource.failed(error: ErrorException(message: dummyError));
      //When
      final result = await sut.addList(
          list: ListEntity(title: 'Title 1', items: [
        ItemEntity(
          title: 'Item 1',
          description: 'Description 1',
          createdAt: DateTime(2024, 5, 19, 0, 0, 0),
          changedAt: DateTime(2024, 5, 19, 0, 0, 0),
        ),
        ItemEntity(
          title: 'Item 2',
          description: 'Description 2',
          createdAt: DateTime(2024, 5, 19, 0, 0, 0),
          changedAt: DateTime(2024, 5, 19, 0, 0, 0),
        ),
      ]));
      //Then
      expect(result.error, isNotNull);
      expect(result.data, isNull);
      expect(result.error, isA<ErrorException>());
      expect(result.error!.message, equals(dummyError));
    }));
    test("When updateList success, it returns 1", (() async {
      //Given
      const dummyString = 'Title 1';
      datasourceStub.returnedUpdateDeleteAdd = Resource.success(data: 1);
      //When
      final result = await sut.updateList(
          title: dummyString,
          list: ListEntity(title: 'Title 2', items: [
            ItemEntity(
              title: 'Item 1',
              description: 'Description 1',
              createdAt: DateTime(2024, 5, 19, 0, 0, 0),
              changedAt: DateTime(2024, 5, 19, 0, 0, 0),
            ),
            ItemEntity(
              title: 'Item 2',
              description: 'Description 2',
              createdAt: DateTime(2024, 5, 19, 0, 0, 0),
              changedAt: DateTime(2024, 5, 19, 0, 0, 0),
            ),
          ]));
      //Then
      expect(result.error, isNull);
      expect(result.data, isNotNull);
      expect(result.data, isA<int>());
      expect(result.data!, equals(1));
    }));
    test("When updateList fails, it returns an ErrorException", (() async {
      //Given
      const dummyError = 'dummyError';
      const dummyString = 'Title 1';
      datasourceStub.returnedUpdateDeleteAdd =
          Resource.failed(error: ErrorException(message: dummyError));
      //When
      final result = await sut.updateList(
          title: dummyString,
          list: ListEntity(title: 'Title 2', items: [
            ItemEntity(
              title: 'Item 1',
              description: 'Description 1',
              createdAt: DateTime(2024, 5, 19, 0, 0, 0),
              changedAt: DateTime(2024, 5, 19, 0, 0, 0),
            ),
            ItemEntity(
              title: 'Item 2',
              description: 'Description 2',
              createdAt: DateTime(2024, 5, 19, 0, 0, 0),
              changedAt: DateTime(2024, 5, 19, 0, 0, 0),
            ),
          ]));
      //Then
      expect(result.error, isNotNull);
      expect(result.data, isNull);
      expect(result.error, isA<ErrorException>());
      expect(result.error!.message, equals(dummyError));
    }));
    test("When deleteList success, it returns 1", (() async {
      //Given
      const dummyString = 'Title 1';
      datasourceStub.returnedUpdateDeleteAdd = Resource.success(data: 1);
      //When
      final result = await sut.deleteList(
        title: dummyString,
      );
      //Then
      expect(result.error, isNull);
      expect(result.data, isNotNull);
      expect(result.data, isA<int>());
      expect(result.data!, equals(1));
    }));
    test("When deleteList fails, it returns an ErrorException", (() async {
      //Given
      const dummyError = 'dummyError';
      const dummyString = 'Title 1';
      datasourceStub.returnedUpdateDeleteAdd =
          Resource.failed(error: ErrorException(message: dummyError));
      //When
      final result = await sut.deleteList(
        title: dummyString,
      );
      //Then
      expect(result.error, isNotNull);
      expect(result.data, isNull);
      expect(result.error, isA<ErrorException>());
      expect(result.error!.message, equals(dummyError));
    }));
  });
}

class DatabaseClientDataSourceStub implements DatabaseClientDataSource {
  late Resource<int, ErrorException> returnedUpdateDeleteAdd;
  late Resource<Map<String, dynamic>, ErrorException> returnedRead;
  late Resource<List<Map<String, dynamic>>, ErrorException> returnedReads;
  @override
  Future<Resource<int, ErrorException>> addList(
      {required Map<String, dynamic> list}) async {
    return returnedUpdateDeleteAdd;
  }

  @override
  Future<Resource<int, ErrorException>> deleteList(
      {required String title}) async {
    return returnedUpdateDeleteAdd;
  }

  @override
  Future<Resource<Map<String, dynamic>, ErrorException>> readList(
      {required String title}) async {
    return returnedRead;
  }

  @override
  Future<Resource<List<Map<String, dynamic>>, ErrorException>>
      readLists() async {
    return returnedReads;
  }

  @override
  Future<Resource<int, ErrorException>> updateList(
      {required String title, required Map<String, dynamic> list}) async {
    return returnedUpdateDeleteAdd;
  }
}
