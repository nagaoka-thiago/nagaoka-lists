import 'package:intl/intl.dart';
import 'package:nagaoka_lists/src/core/adapters/database/domain/entities_keys/item_keys.dart';

class ItemEntity {
  String title;
  String description;
  DateTime createdAt;
  DateTime changedAt;

  ItemEntity(
      {required this.title,
      required this.description,
      required this.createdAt,
      required this.changedAt});

  static ItemEntity fromJson(Map<String, dynamic> json) {
    return ItemEntity(
      title: json[ItemKeys.title],
      description: json[ItemKeys.description],
      createdAt:
          DateFormat('dd/MM/yyyy hh:mm:ss').parse(json[ItemKeys.createdAt]),
      changedAt:
          DateFormat('dd/MM/yyyy hh:mm:ss').parse(json[ItemKeys.changedAt]),
    );
  }

  static Map<String, dynamic> toJson(ItemEntity entity) {
    return {
      ItemKeys.changedAt:
          DateFormat('dd/MM/yyyy hh:mm:ss').format(entity.changedAt),
      ItemKeys.createdAt:
          DateFormat('dd/MM/yyyy hh:mm:ss').format(entity.createdAt),
      ItemKeys.description: entity.description,
      ItemKeys.title: entity.title,
    };
  }
}
