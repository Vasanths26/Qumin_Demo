import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import './romodel.dart';
part 'service.g.dart';

class ServiceResData = RestaurantService with _$ServiceResData;

abstract class RestaurantService with Store {
  @observable
  bool user = false;
  @action
  void userq() {
    user = !user;
  }

  @observable
  List appertizer = [];
  @observable
  List<MenuItem> menuItems = [];
  @observable
  List<MenuCategory> menuCategories = [];
  @observable
  List<MenuCategoryDishType> dishtype = [];
  @observable
  List<Filter> filters = [];

  Future<List<dynamic>> fetchData() async {
    String jsonData = await rootBundle.loadString('assets/g.json');

    Res res = Res.fromJson(json.decode(jsonData));
    filters = res.result.filters;
    menuCategories = res.result.menuCategories;
    menuItems = menuCategories
        .expand((category) =>
            category.dishTypes.expand((dishType) => dishType.menuItems))
        .toList();

    dishtype = menuCategories.expand((element) => element.dishTypes).toList();
    return [
      menuItems,
      menuCategories,
      dishtype,
      filters,
    ];
  }
}
