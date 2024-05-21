import 'package:mobx/mobx.dart';
import 'package:nagaoka_lists/src/core/adapters/database/domain/entities/list_entity.dart';

part 'form_controller.g.dart';

class FormController = FormControllerBase with _$FormController;

abstract class FormControllerBase with Store {
  @observable
  ListEntity? entity;

  @observable
  String? title;

  @action
  void setTitle(String newVal) => title = newVal;

  @action
  void initializeEntity(ListEntity? oldEntity) {
    if (oldEntity != null) {
      entity = oldEntity;
      title = oldEntity.title;
    }
  }
}
