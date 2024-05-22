// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FormController on FormControllerBase, Store {
  late final _$entityAtom =
      Atom(name: 'FormControllerBase.entity', context: context);

  @override
  ListEntity? get entity {
    _$entityAtom.reportRead();
    return super.entity;
  }

  @override
  set entity(ListEntity? value) {
    _$entityAtom.reportWrite(value, super.entity, () {
      super.entity = value;
    });
  }

  late final _$listTitleAtom =
      Atom(name: 'FormControllerBase.listTitle', context: context);

  @override
  String? get listTitle {
    _$listTitleAtom.reportRead();
    return super.listTitle;
  }

  @override
  set listTitle(String? value) {
    _$listTitleAtom.reportWrite(value, super.listTitle, () {
      super.listTitle = value;
    });
  }

  late final _$oldListTitleAtom =
      Atom(name: 'FormControllerBase.oldListTitle', context: context);

  @override
  String? get oldListTitle {
    _$oldListTitleAtom.reportRead();
    return super.oldListTitle;
  }

  @override
  set oldListTitle(String? value) {
    _$oldListTitleAtom.reportWrite(value, super.oldListTitle, () {
      super.oldListTitle = value;
    });
  }

  late final _$itemsAtom =
      Atom(name: 'FormControllerBase.items', context: context);

  @override
  ObservableList<ItemEntity> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(ObservableList<ItemEntity> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  late final _$numItemsAddedAtom =
      Atom(name: 'FormControllerBase.numItemsAdded', context: context);

  @override
  int get numItemsAdded {
    _$numItemsAddedAtom.reportRead();
    return super.numItemsAdded;
  }

  @override
  set numItemsAdded(int value) {
    _$numItemsAddedAtom.reportWrite(value, super.numItemsAdded, () {
      super.numItemsAdded = value;
    });
  }

  late final _$deleteItemAsyncAction =
      AsyncAction('FormControllerBase.deleteItem', context: context);

  @override
  Future<void> deleteItem(int index) {
    return _$deleteItemAsyncAction.run(() => super.deleteItem(index));
  }

  late final _$FormControllerBaseActionController =
      ActionController(name: 'FormControllerBase', context: context);

  @override
  void setListTitle(String newVal) {
    final _$actionInfo = _$FormControllerBaseActionController.startAction(
        name: 'FormControllerBase.setListTitle');
    try {
      return super.setListTitle(newVal);
    } finally {
      _$FormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setItemTitle(int i, String newVal) {
    final _$actionInfo = _$FormControllerBaseActionController.startAction(
        name: 'FormControllerBase.setItemTitle');
    try {
      return super.setItemTitle(i, newVal);
    } finally {
      _$FormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setItemDescription(int i, String newVal) {
    final _$actionInfo = _$FormControllerBaseActionController.startAction(
        name: 'FormControllerBase.setItemDescription');
    try {
      return super.setItemDescription(i, newVal);
    } finally {
      _$FormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void incrementItemsAdded() {
    final _$actionInfo = _$FormControllerBaseActionController.startAction(
        name: 'FormControllerBase.incrementItemsAdded');
    try {
      return super.incrementItemsAdded();
    } finally {
      _$FormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initializeEntity(ListEntity? oldEntity) {
    final _$actionInfo = _$FormControllerBaseActionController.startAction(
        name: 'FormControllerBase.initializeEntity');
    try {
      return super.initializeEntity(oldEntity);
    } finally {
      _$FormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
entity: ${entity},
listTitle: ${listTitle},
oldListTitle: ${oldListTitle},
items: ${items},
numItemsAdded: ${numItemsAdded}
    ''';
  }
}
