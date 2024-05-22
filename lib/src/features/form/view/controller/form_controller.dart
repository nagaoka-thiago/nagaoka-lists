import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nagaoka_lists/src/core/adapters/database/domain/entities/item_entity.dart';
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
  String? listTitle;

  @observable
  String? oldListTitle;

  @observable
  ObservableList<ItemEntity> items = ObservableList();

  @observable
  int numItemsAdded = 0;

  @action
  void setListTitle(String newVal) => listTitle = newVal;

  @action
  void setItemTitle(int i, String newVal) {
    items[i].title = newVal;
    items[i].changedAt = DateTime.now();
  }

  @action
  void setItemDescription(int i, String newVal) {
    items[i].description = newVal;
    items[i].changedAt = DateTime.now();
  }

  @action
  void incrementItemsAdded() {
    numItemsAdded++;
    items.add(ItemEntity(
        title: '',
        description: '',
        createdAt: DateTime.now(),
        changedAt: DateTime.now()));
  }

  @action
  Future<void> deleteItem(int index) async {
    if (items.isNotEmpty) {
      items.removeAt(index);
      if (numItemsAdded > 0) {
        numItemsAdded--;
      }
    }
  }

  @action
  void initializeEntity(ListEntity? oldEntity) {
    if (oldEntity != null) {
      entity = oldEntity;
      listTitle = oldEntity.title;
      oldListTitle = listTitle;
      items = oldEntity.items.asObservable();
      numItemsAdded = items.length;
    } else {
      entity = null;
      listTitle = '';
      items = <ItemEntity>[].asObservable();
      numItemsAdded = 0;
    }
  }

  Future<String> addOrUpdateList() async {
    if (entity == null) {
      items = items
          .map((item) {
            item.createdAt = DateTime.now();
            item.changedAt = DateTime.now();
            return item;
          })
          .toList()
          .asObservable();
      final newEntity = ListEntity(title: listTitle!, items: items);
      final result = await _addListUsecase.call(list: newEntity);

      if (result.hasError) {
        return result.error!.message;
      }
    } else {
      entity!.title = listTitle!;
      entity!.items = items;
      final result =
          await _updateListUsecase.call(title: oldListTitle!, list: entity!);

      if (result.hasError) {
        return result.error!.message;
      }
    }

    return 'Success';
  }
}
