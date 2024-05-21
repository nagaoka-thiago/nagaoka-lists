import 'package:nagaoka_lists/src/core/adapters/database/domain/entities/list_entity.dart';
import 'package:nagaoka_lists/src/core/errors/error_exception.dart';
import 'package:nagaoka_lists/src/core/generics/resource.dart';

abstract class DatabaseClientRepository {
  Future<Resource<List<ListEntity>, ErrorException>> readLists();
  Future<Resource<ListEntity, ErrorException>> readList(
      {required String title});
  Future<Resource<int, ErrorException>> addList({required ListEntity list});
  Future<Resource<int, ErrorException>> updateList(
      {required String title, required ListEntity list});
  Future<Resource<int, ErrorException>> deleteList({required String title});
}
