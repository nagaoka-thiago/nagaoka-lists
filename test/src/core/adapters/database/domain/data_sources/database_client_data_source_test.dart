import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:nagaoka_lists/src/app_module.dart';
import 'package:nagaoka_lists/src/core/adapters/database/data/data_sources/database_client_data_source_impl.dart';
import 'package:nagaoka_lists/src/core/generics/status.dart';

void main() async {
  final firestoreStub = FakeFirebaseFirestore();
  group('Database Client Data Source tests', () {
    initModule(AppModule(),
        replaceBinds: [Bind.instance<FirebaseFirestore>(firestoreStub)]);
    final sut = DatabaseClientDataSourceImpl();

    test("When readLists success, it returns a list of maps", (() async {
      //Given
      await firestoreStub.collection('lists').add({
        'title': 'Lista 1',
        'items': [
          {
            'changedAt': '19/05/2024',
            'createdAt': '19/05/2024',
            'description': 'Description 1',
            'title': 'Item 1',
          },
          {
            'changedAt': '19/05/2024',
            'createdAt': '19/05/2024',
            'description': 'Description 2',
            'title': 'Item 2',
          },
          {
            'changedAt': '19/05/2024',
            'createdAt': '19/05/2024',
            'description': 'Description 3',
            'title': 'Item 3',
          },
        ],
      });
      //When
      final result = await sut.readLists();
      //Then
      expect(result.error, isNull);
      expect(result.data, isNotNull);
      expect(result.data, isA<List>());
      expect(result.status, Status.success);

      // deletes all documents added for this test
      firestoreStub.collection('lists').get().then((snapshot) {
        for (DocumentSnapshot ds in snapshot.docs) {
          ds.reference.delete();
        }
      });
    }));
    test("When readList success, it returns a map", (() async {
      //Given
      await firestoreStub.collection('lists').add({
        'title': 'Lista 1',
        'items': [
          {
            'changedAt': '19/05/2024',
            'createdAt': '19/05/2024',
            'description': 'Description 1',
            'title': 'Item 1',
          },
          {
            'changedAt': '19/05/2024',
            'createdAt': '19/05/2024',
            'description': 'Description 2',
            'title': 'Item 2',
          },
          {
            'changedAt': '19/05/2024',
            'createdAt': '19/05/2024',
            'description': 'Description 3',
            'title': 'Item 3',
          },
        ],
      });
      //When
      const dummyString = 'Lista 1';
      final result = await sut.readList(title: dummyString);
      //Then
      expect(result.error, isNull);
      expect(result.data, isNotNull);
      expect(result.data, isA<Map>());
      expect(result.status, Status.success);

      // deletes all documents added for this test
      firestoreStub.collection('lists').get().then((snapshot) {
        for (DocumentSnapshot ds in snapshot.docs) {
          ds.reference.delete();
        }
      });
    }));
    test("When addList success, it returns 1", (() async {
      //Given
      await firestoreStub.collection('lists').add({
        'title': 'Lista 1',
        'items': [
          {
            'changedAt': '19/05/2024',
            'createdAt': '19/05/2024',
            'description': 'Description 1',
            'title': 'Item 1',
          },
          {
            'changedAt': '19/05/2024',
            'createdAt': '19/05/2024',
            'description': 'Description 2',
            'title': 'Item 2',
          },
          {
            'changedAt': '19/05/2024',
            'createdAt': '19/05/2024',
            'description': 'Description 3',
            'title': 'Item 3',
          },
        ],
      });
      //When
      final result = await sut.addList(list: {
        'title': 'Lista 2',
        'items': [
          {
            'changedAt': '19/05/2024',
            'createdAt': '19/05/2024',
            'description': 'Description 1',
            'title': 'Item 1',
          },
          {
            'changedAt': '19/05/2024',
            'createdAt': '19/05/2024',
            'description': 'Description 2',
            'title': 'Item 2',
          },
          {
            'changedAt': '19/05/2024',
            'createdAt': '19/05/2024',
            'description': 'Description 3',
            'title': 'Item 3',
          },
        ],
      });
      final testing = await sut.readLists();
      //Then
      expect(result.error, isNull);
      expect(result.data, isNotNull);
      expect(result.data, equals(1));
      expect(result.status, Status.success);
      expect(testing.data!.length, equals(2));

      // deletes all documents added for this test
      firestoreStub.collection('lists').get().then((snapshot) {
        for (DocumentSnapshot ds in snapshot.docs) {
          ds.reference.delete();
        }
      });
    }));
    test("When updateList success, it returns 1", (() async {
      //Given
      await firestoreStub.collection('lists').add({
        'title': 'Lista 1',
        'items': [
          {
            'changedAt': '19/05/2024',
            'createdAt': '19/05/2024',
            'description': 'Description 1',
            'title': 'Item 1',
          },
          {
            'changedAt': '19/05/2024',
            'createdAt': '19/05/2024',
            'description': 'Description 2',
            'title': 'Item 2',
          },
          {
            'changedAt': '19/05/2024',
            'createdAt': '19/05/2024',
            'description': 'Description 3',
            'title': 'Item 3',
          },
        ],
      });
      //When
      const dummyString = 'Lista 1';
      final result = await sut.updateList(title: dummyString, list: {
        'title': 'Lista 1',
        'items': [
          {
            'changedAt': '19/05/2024',
            'createdAt': '19/05/2024',
            'description': 'Description 2',
            'title': 'Item 1',
          },
          {
            'changedAt': '19/05/2024',
            'createdAt': '19/05/2024',
            'description': 'Description 2',
            'title': 'Item 2',
          },
          {
            'changedAt': '19/05/2024',
            'createdAt': '19/05/2024',
            'description': 'Description 3',
            'title': 'Item 3',
          },
        ],
      });
      final testing = await sut.readList(title: dummyString);
      //Then
      expect(result.error, isNull);
      expect(result.data, isNotNull);
      expect(result.data, equals(1));
      expect(result.status, Status.success);
      expect(testing.data!['items'][0]['description'], equals('Description 2'));

      // deletes all documents added for this test
      firestoreStub.collection('lists').get().then((snapshot) {
        for (DocumentSnapshot ds in snapshot.docs) {
          ds.reference.delete();
        }
      });
    }));
    test("When deleteList success, it returns 1", (() async {
      //Given
      await firestoreStub.collection('lists').add({
        'title': 'Lista 1',
        'items': [
          {
            'changedAt': '19/05/2024',
            'createdAt': '19/05/2024',
            'description': 'Description 1',
            'title': 'Item 1',
          },
          {
            'changedAt': '19/05/2024',
            'createdAt': '19/05/2024',
            'description': 'Description 2',
            'title': 'Item 2',
          },
          {
            'changedAt': '19/05/2024',
            'createdAt': '19/05/2024',
            'description': 'Description 3',
            'title': 'Item 3',
          },
        ],
      });
      //When
      const dummyString = 'Lista 1';
      final result = await sut.deleteList(title: dummyString);
      final testing = await sut.readList(title: dummyString);
      //Then
      expect(result.error, isNull);
      expect(result.data, isNotNull);
      expect(result.data, equals(1));
      expect(result.status, Status.success);
      expect(testing.data, isNull);
    }));
  });
}
