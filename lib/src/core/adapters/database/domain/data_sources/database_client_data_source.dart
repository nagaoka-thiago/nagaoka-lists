import 'package:nagaoka_lists/src/core/errors/error_exception.dart';
import 'package:nagaoka_lists/src/core/generics/resource.dart';

abstract class DatabaseClientDataSource {
  Future<Resource<List<Map<String, dynamic>>, ErrorException>> readLists();
  Future<Resource<Map<String, dynamic>, ErrorException>> readList(
      {required String title});
  Future<Resource<int, ErrorException>> addList(
      {required Map<String, dynamic> list});
  Future<Resource<int, ErrorException>> updateList(
      {required String title, required Map<String, dynamic> list});
  Future<Resource<int, ErrorException>> deleteList({required String title});
}
