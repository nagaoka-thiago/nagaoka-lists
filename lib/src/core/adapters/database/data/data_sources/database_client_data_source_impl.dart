import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nagaoka_lists/src/core/adapters/database/domain/data_sources/database_client_data_source.dart';
import 'package:nagaoka_lists/src/core/adapters/database/domain/entities_keys/list_keys.dart';
import 'package:nagaoka_lists/src/core/errors/error_exception.dart';
import 'package:nagaoka_lists/src/core/generics/resource.dart';

class DatabaseClientDataSourceImpl implements DatabaseClientDataSource {
  final db = Modular.get<FirebaseFirestore>();
  @override
  Future<Resource<List<Map<String, dynamic>>, ErrorException>>
      readLists() async {
    try {
      final querySnapshot = await db.collection('lists').get();
      List<Map<String, dynamic>> lists = [];
      for (var queryDocumentSnapshot in querySnapshot.docs) {
        lists.add(queryDocumentSnapshot.data());
      }

      return Resource.success(data: lists);
    } on Exception catch (e) {
      return Resource.failed(error: ErrorException(message: e.asString()));
    }
  }

  @override
  Future<Resource<Map<String, dynamic>, ErrorException>> readList(
      {required String title}) async {
    try {
      final querySnapshot = await db.collection('lists').get();
      for (var queryDocumentSnapshot in querySnapshot.docs) {
        final data = queryDocumentSnapshot.data();
        if (data[ListKeys.title] == title) {
          return Resource.success(data: data);
        }
      }

      return Resource.success(data: null);
    } on Exception catch (e) {
      return Resource.failed(error: ErrorException(message: e.asString()));
    }
  }

  @override
  Future<Resource<int, ErrorException>> addList(
      {required Map<String, dynamic> list}) async {
    try {
      final existedListTitle = await readList(title: list[ListKeys.title]);
      if (existedListTitle.data == null) {
        db.collection('lists').add(list);
        return Resource.success(data: 1);
      } else {
        return Resource.failed(
            error: ErrorException(
                message: 'List with the same title already exists!'));
      }
    } on Exception catch (e) {
      return Resource.failed(error: ErrorException(message: e.asString()));
    }
  }

  @override
  Future<Resource<int, ErrorException>> updateList(
      {required String title, required Map<String, dynamic> list}) async {
    try {
      final existedListTitle = await readList(title: list[ListKeys.title]);
      if (title == list[ListKeys.title] || existedListTitle.data == null) {
        final querySnapshot = await db.collection('lists').get();
        late String idFound;
        for (var queryDocumentSnapshot in querySnapshot.docs) {
          final data = queryDocumentSnapshot.data();
          final uid = queryDocumentSnapshot.id;
          if (data[ListKeys.title] == title) {
            idFound = uid;
            break;
          }
        }

        await db.collection("lists").doc(idFound).update(list);

        return Resource.success(data: 1);
      } else {
        return Resource.failed(
            error: ErrorException(
                message: 'List with the same title already exists!'));
      }
    } on Exception catch (e) {
      return Resource.failed(error: ErrorException(message: e.asString()));
    }
  }

  @override
  Future<Resource<int, ErrorException>> deleteList(
      {required String title}) async {
    try {
      final querySnapshot = await db.collection('lists').get();
      late String idFound;
      for (var queryDocumentSnapshot in querySnapshot.docs) {
        final data = queryDocumentSnapshot.data();
        final uid = queryDocumentSnapshot.id;
        if (data[ListKeys.title] == title) {
          idFound = uid;
          break;
        }
      }

      await db.collection("lists").doc(idFound).delete();

      return Resource.success(data: 1);
    } on Exception catch (e) {
      return Resource.failed(error: ErrorException(message: e.asString()));
    }
  }
}
