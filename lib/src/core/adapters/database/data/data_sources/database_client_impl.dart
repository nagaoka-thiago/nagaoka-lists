import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:nagaoka_lists/src/core/adapters/database/domain/data_sources/database_client.dart';
import 'package:nagaoka_lists/src/core/errors/error_exception.dart';
import 'package:nagaoka_lists/src/core/generics/resource.dart';

class DatabaseClientImpl implements DatabaseClient {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<Resource<List<Map<String, dynamic>>, ErrorException>>
      readLists() async {
    return Resource.success();
  }

  Future<Resource<Map<String, dynamic>, ErrorException>> readList(
      {required String uid}) async {
    return Resource.success();
  }

  Future<Resource<int, ErrorException>> updateList(
      {required Map<String, dynamic> list}) async {
    return Resource.success();
  }

  Future<Resource<int, ErrorException>> deleteList(
      {required String uid}) async {
    return Resource.success();
  }
}
