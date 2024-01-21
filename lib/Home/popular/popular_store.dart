// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:app_data/Home/popular/popular_model.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';

part 'popular_store.g.dart';

// ignore: library_private_types_in_public_api
class PopularStore = _PopularStore with _$PopularStore;

abstract class _PopularStore with Store {
  @observable
  ObservableList<PopularModel> popular = ObservableList<PopularModel>();

  @action
  Future<void> loadPopularFromJson() async {
    try {
      final String jsonString =
          await rootBundle.loadString('assets/newdart/popular.json');
      final List<dynamic> jsonList = json.decode(jsonString);
      final List<PopularModel> newFeeds =
          jsonList.map((json) => PopularModel.fromJson(json)).toList();

      popular.clear();
      popular.addAll(newFeeds);
    } catch (e) {
      print('Error loading feeds: $e');
    }
  }
}
