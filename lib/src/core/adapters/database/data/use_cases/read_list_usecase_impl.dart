import 'package:flutter_modular/flutter_modular.dart';
import 'package:nagaoka_lists/src/core/adapters/database/domain/entities/list_entity.dart';
import 'package:nagaoka_lists/src/core/adapters/database/domain/repositories/database_client_repository.dart';
import 'package:nagaoka_lists/src/core/adapters/database/domain/use_cases/read_list_usecase.dart';
import 'package:nagaoka_lists/src/core/errors/error_exception.dart';
import 'package:nagaoka_lists/src/core/generics/resource.dart';

class ReadListUsecaseImpl implements ReadListUsecase {
  final repository = Modular.get<DatabaseClientRepository>();
  @override
  Future<Resource<ListEntity, ErrorException>> call({required String title}) {
    return repository.readList(title: title);
  }
}
