import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nagaoka_lists/src/core/adapters/database/domain/entities/list_entity.dart';
import 'package:nagaoka_lists/src/core/adapters/database/domain/use_cases/read_lists_usecase.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final _readListsUsecase = Modular.get<ReadListsUsecase>();
  @observable
  ObservableList<ListEntity> lists = ObservableList();

  @action
  Future<void> initializeLists() async {
    final result = await _readListsUsecase.call();

    if (!result.hasError) {
      lists = result.data!.asObservable();
    }
  }
}
