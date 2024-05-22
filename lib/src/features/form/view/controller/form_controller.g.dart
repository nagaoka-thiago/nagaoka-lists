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

  late final _$titleAtom =
      Atom(name: 'FormControllerBase.title', context: context);

  @override
  String? get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String? value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$oldTitleAtom =
      Atom(name: 'FormControllerBase.oldTitle', context: context);

  @override
  String? get oldTitle {
    _$oldTitleAtom.reportRead();
    return super.oldTitle;
  }

  @override
  set oldTitle(String? value) {
    _$oldTitleAtom.reportWrite(value, super.oldTitle, () {
      super.oldTitle = value;
    });
  }

  late final _$FormControllerBaseActionController =
      ActionController(name: 'FormControllerBase', context: context);

  @override
  void setTitle(String newVal) {
    final _$actionInfo = _$FormControllerBaseActionController.startAction(
        name: 'FormControllerBase.setTitle');
    try {
      return super.setTitle(newVal);
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
title: ${title},
oldTitle: ${oldTitle}
    ''';
  }
}
