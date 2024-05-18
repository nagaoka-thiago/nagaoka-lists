import 'package:nagaoka_lists/src/core/adapters/database/domain/entities/item_entity.dart';
import 'package:nagaoka_lists/src/core/adapters/database/domain/entities_keys/list_keys.dart';

class ListEntity {
  final String uid;
  final List<ItemEntity> items;

  ListEntity({required this.uid, required this.items});

  static ListEntity fromJson(Map<String, dynamic> json) {
    final itemsListJsons = json[ListKeys.items] as List;
    final itemsListEntities = itemsListJsons
        .map((itemJson) => ItemEntity.fromJson(itemJson))
        .toList();

    return ListEntity(uid: json[ListKeys.uid], items: itemsListEntities);
  }

  static Map<String, dynamic> toJson(ListEntity entity) {
    final itemsListEntities = entity.items;
    final itemsListJsons = itemsListEntities
        .map((itemEntity) => ItemEntity.toJson(itemEntity))
        .toList();
    return {
      ListKeys.uid: entity.uid,
      ListKeys.items: itemsListJsons,
    };
  }
}
