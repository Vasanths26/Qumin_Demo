// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';

import '../res/romodel.dart';
part 'fetch_api.g.dart';

class FetchApi = _FetchApi with _$FetchApi;

abstract class _FetchApi with Store {
  @observable
  List<MenuCategory> menuCategory = [];

  @observable
  List<MenuItem> menuItem = [];

  @observable
  List<MenuCategoryDishType> dishType = [];

  @observable
  String? errors;

  @action
  Future<List<dynamic>> fetchRestaurantData() async {
    try {
      final jsonStr =
          await rootBundle.loadString('assets/newdart/restaurant.json');
      Res restaurents = Res.fromJson(json.decode(jsonStr));
      menuCategory = restaurents.result.menuCategories;
      menuItem = menuCategory
          .expand((catagory) =>
              catagory.dishTypes.expand((types) => types.menuItems))
          .toList();
      dishType = menuCategory.expand((element) => element.dishTypes).toList();
      print(menuCategory);
      print(menuItem);
      print(dishType);
    } catch (error) {
      errors = error.toString();
      print('Error: $errors');
    }
    return [menuCategory, menuItem, dishType];
  }
}
