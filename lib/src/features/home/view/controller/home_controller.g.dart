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

  late final _$listExpandedAtom =
      Atom(name: 'HomeControllerBase.listExpanded', context: context);

  @override
  ObservableList<bool> get listExpanded {
    _$listExpandedAtom.reportRead();
    return super.listExpanded;
  }

  @override
  set listExpanded(ObservableList<bool> value) {
    _$listExpandedAtom.reportWrite(value, super.listExpanded, () {
      super.listExpanded = value;
    });
  }

  late final _$initializeListsAsyncAction =
      AsyncAction('HomeControllerBase.initializeLists', context: context);

  @override
  Future<void> initializeLists() {
    return _$initializeListsAsyncAction.run(() => super.initializeLists());
  }

  late final _$deleteListAsyncAction =
      AsyncAction('HomeControllerBase.deleteList', context: context);

  @override
  Future<void> deleteList(ListEntity? list) {
    return _$deleteListAsyncAction.run(() => super.deleteList(list));
  }

  late final _$toggleListAsyncAction =
      AsyncAction('HomeControllerBase.toggleList', context: context);

  @override
  Future<void> toggleList(int index) {
    return _$toggleListAsyncAction.run(() => super.toggleList(index));
  }

  @override
  String toString() {
    return '''
lists: ${lists},
listExpanded: ${listExpanded}
    ''';
  }
}
