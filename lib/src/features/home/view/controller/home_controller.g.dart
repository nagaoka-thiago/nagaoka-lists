// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on HomeControllerBase, Store {
  late final _$listsAtom =
      Atom(name: 'HomeControllerBase.lists', context: context);

  @override
  ObservableList<ListEntity> get lists {
    _$listsAtom.reportRead();
    return super.lists;
  }

  @override
  set lists(ObservableList<ListEntity> value) {
    _$listsAtom.reportWrite(value, super.lists, () {
      super.lists = value;
    });
  }

  late final _$initializeListsAsyncAction =
      AsyncAction('HomeControllerBase.initializeLists', context: context);

  @override
  Future<void> initializeLists() {
    return _$initializeListsAsyncAction.run(() => super.initializeLists());
  }

  @override
  String toString() {
    return '''
lists: ${lists}
    ''';
  }
}
