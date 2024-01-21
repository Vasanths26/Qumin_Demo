// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appetizer_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppetizerStore on _AppetizerStore, Store {
  late final _$_isExpandAtom =
      Atom(name: '_AppetizerStore._isExpand', context: context);

  @override
  bool get _isExpand {
    _$_isExpandAtom.reportRead();
    return super._isExpand;
  }

  @override
  set _isExpand(bool value) {
    _$_isExpandAtom.reportWrite(value, super._isExpand, () {
      super._isExpand = value;
    });
  }

  late final _$_AppetizerStoreActionController =
      ActionController(name: '_AppetizerStore', context: context);

  @override
  bool expand() {
    final _$actionInfo = _$_AppetizerStoreActionController.startAction(
        name: '_AppetizerStore.expand');
    try {
      return super.expand();
    } finally {
      _$_AppetizerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool toggleExpand() {
    final _$actionInfo = _$_AppetizerStoreActionController.startAction(
        name: '_AppetizerStore.toggleExpand');
    try {
      return super.toggleExpand();
    } finally {
      _$_AppetizerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
