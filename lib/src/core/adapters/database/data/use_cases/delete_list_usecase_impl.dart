import 'package:flutter_modular/flutter_modular.dart';
import 'package:nagaoka_lists/src/core/adapters/database/domain/repositories/database_client_repository.dart';
import 'package:nagaoka_lists/src/core/adapters/database/domain/use_cases/delete_list_usecase.dart';
import 'package:nagaoka_lists/src/core/errors/error_exception.dart';
import 'package:nagaoka_lists/src/core/generics/resource.dart';

class DeleteListUsecaseImpl implements DeleteListUsecase {
  final repository = Modular.get<DatabaseClientRepository>();
  @override
  Future<Resource<int, ErrorException>> call({required String title}) {
    return repository.deleteList(title: title);
  }
}
