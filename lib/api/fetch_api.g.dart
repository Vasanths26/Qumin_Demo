// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_api.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FetchApi on _FetchApi, Store {
  late final _$menuCategoryAtom =
      Atom(name: '_FetchApi.menuCategory', context: context);

  @override
  List<MenuCategory> get menuCategory {
    _$menuCategoryAtom.reportRead();
    return super.menuCategory;
  }

  @override
  set menuCategory(List<MenuCategory> value) {
    _$menuCategoryAtom.reportWrite(value, super.menuCategory, () {
      super.menuCategory = value;
    });
  }

  late final _$menuItemAtom =
      Atom(name: '_FetchApi.menuItem', context: context);

  @override
  List<MenuItem> get menuItem {
    _$menuItemAtom.reportRead();
    return super.menuItem;
  }

  @override
  set menuItem(List<MenuItem> value) {
    _$menuItemAtom.reportWrite(value, super.menuItem, () {
      super.menuItem = value;
    });
  }

  late final _$dishTypeAtom =
      Atom(name: '_FetchApi.dishType', context: context);

  @override
  List<MenuCategoryDishType> get dishType {
    _$dishTypeAtom.reportRead();
    return super.dishType;
  }

  @override
  set dishType(List<MenuCategoryDishType> value) {
    _$dishTypeAtom.reportWrite(value, super.dishType, () {
      super.dishType = value;
    });
  }

  late final _$errorsAtom = Atom(name: '_FetchApi.errors', context: context);

  @override
  String? get errors {
    _$errorsAtom.reportRead();
    return super.errors;
  }

  @override
  set errors(String? value) {
    _$errorsAtom.reportWrite(value, super.errors, () {
      super.errors = value;
    });
  }

  late final _$fetchRestaurantDataAsyncAction =
      AsyncAction('_FetchApi.fetchRestaurantData', context: context);

  @override
  Future<List<dynamic>> fetchRestaurantData() {
    return _$fetchRestaurantDataAsyncAction
        .run(() => super.fetchRestaurantData());
  }

  @override
  String toString() {
    return '''
menuCategory: ${menuCategory},
menuItem: ${menuItem},
dishType: ${dishType},
errors: ${errors}
    ''';
  }
}
