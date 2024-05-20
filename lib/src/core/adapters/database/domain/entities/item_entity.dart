import 'package:nagaoka_lists/src/core/adapters/database/domain/entities_keys/item_keys.dart';

class ItemEntity {
  final String title;
  final String description;
  final DateTime createdAt;
  final DateTime changedAt;

  const ItemEntity(
      {required this.title,
      required this.description,
      required this.createdAt,
      required this.changedAt});

  static ItemEntity fromJson(Map<String, dynamic> json) {
    return ItemEntity(
      title: json[ItemKeys.title],
      description: json[ItemKeys.description],
      createdAt: json[ItemKeys.createdAt],
      changedAt: json[ItemKeys.changedAt],
    );
  }

  static Map<String, dynamic> toJson(ItemEntity entity) {
    return {
      ItemKeys.changedAt: entity.changedAt,
      ItemKeys.createdAt: entity.createdAt,
      ItemKeys.description: entity.description,
      ItemKeys.title: entity.title,
    };
  }
}
