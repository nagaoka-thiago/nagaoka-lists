import 'package:flutter_modular/flutter_modular.dart';
import 'package:nagaoka_lists/src/core/adapters/database/domain/entities/list_entity.dart';
import 'package:nagaoka_lists/src/core/adapters/database/domain/repositories/database_client_repository.dart';
import 'package:nagaoka_lists/src/core/adapters/database/domain/use_cases/add_list_usecase.dart';
import 'package:nagaoka_lists/src/core/errors/error_exception.dart';
import 'package:nagaoka_lists/src/core/generics/resource.dart';

class AddListUsecaseImpl implements AddListUsecase {
  final repository = Modular.get<DatabaseClientRepository>();
  @override
  Future<Resource<int, ErrorException>> call({required ListEntity list}) {
    return repository.addList(list: list);
  }
}
