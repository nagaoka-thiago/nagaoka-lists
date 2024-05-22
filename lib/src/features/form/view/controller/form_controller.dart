import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nagaoka_lists/src/core/adapters/database/domain/entities/list_entity.dart';
import 'package:nagaoka_lists/src/core/adapters/database/domain/use_cases/add_list_usecase.dart';
import 'package:nagaoka_lists/src/core/adapters/database/domain/use_cases/update_list_usecase.dart';

part 'form_controller.g.dart';

class FormController = FormControllerBase with _$FormController;

abstract class FormControllerBase with Store {
  final _addListUsecase = Modular.get<AddListUsecase>();
  final _updateListUsecase = Modular.get<UpdateListUsecase>();

  @observable
  ListEntity? entity;

  @observable
  String? title;

  @observable
  String? oldTitle;

  @action
  void setTitle(String newVal) => title = newVal;

  @action
  void initializeEntity(ListEntity? oldEntity) {
    if (oldEntity != null) {
      entity = oldEntity;
      title = oldEntity.title;
      oldTitle = title;
    } else {
      entity = null;
      title = '';
    }
  }

  Future<void> addOrUpdateList() async {
    if (entity == null) {
      entity = ListEntity(title: title!, items: []);
      await _addListUsecase.call(list: entity!);
    } else {
      entity!.title = title!;
      await _updateListUsecase.call(title: oldTitle!, list: entity!);
    }
  }
}
