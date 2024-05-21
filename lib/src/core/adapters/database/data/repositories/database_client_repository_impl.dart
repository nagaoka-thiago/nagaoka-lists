import 'package:flutter_modular/flutter_modular.dart';
import 'package:nagaoka_lists/src/core/adapters/database/domain/data_sources/database_client_data_source.dart';
import 'package:nagaoka_lists/src/core/adapters/database/domain/entities/list_entity.dart';
import 'package:nagaoka_lists/src/core/adapters/database/domain/repositories/database_client_repository.dart';
import 'package:nagaoka_lists/src/core/errors/error_exception.dart';
import 'package:nagaoka_lists/src/core/generics/resource.dart';

class DatabaseClientRepositoryImpl implements DatabaseClientRepository {
  final datasource = Modular.get<DatabaseClientDataSource>();
  @override
  Future<Resource<int, ErrorException>> addList({required ListEntity list}) {
    final listMap = ListEntity.toJson(list);
    return datasource.addList(list: listMap);
  }

  @override
  Future<Resource<int, ErrorException>> deleteList({required String title}) {
    return datasource.deleteList(title: title);
  }

  @override
  Future<Resource<ListEntity, ErrorException>> readList(
      {required String title}) async {
    final result = await datasource.readList(title: title);
    if (result.hasError) {
      return Resource.failed(error: result.error);
    }

    final data = result.data;
    final entity = ListEntity.fromJson(data!);

    return Resource.success(data: entity);
  }

  @override
  Future<Resource<List<ListEntity>, ErrorException>> readLists() async {
    final result = await datasource.readLists();

    if (result.hasError) {
      return Resource.failed(error: result.error);
    }

    final jsons = result.data;
    final entities = jsons!.map((json) => ListEntity.fromJson(json)).toList();

    return Resource.success(data: entities);
  }

  @override
  Future<Resource<int, ErrorException>> updateList(
      {required String title, required ListEntity list}) {
    final json = ListEntity.toJson(list);
    return datasource.updateList(title: title, list: json);
  }
}
