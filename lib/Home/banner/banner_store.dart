// ignore_for_file: avoid_print, library_private_types_in_public_api

import 'dart:convert';

import 'package:app_data/Home/banner/banner_model.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';

part 'banner_store.g.dart';

class BannerStore = _BannerStore with _$BannerStore;

abstract class _BannerStore with Store {
  @observable
  ObservableList<Banners> banners = ObservableList<Banners>();

  @observable
  int currentIndex = 0;

  @action
  void increment(int index) {
    currentIndex = index;
  }

  @action
  Future<void> loadBannersFromJson() async {
    try {
      final String jsonString =
          await rootBundle.loadString('assets/newdart/banner.json');
      final List<dynamic> jsonList = json.decode(jsonString);
      final List<Banners> newFeeds =
          jsonList.map((json) => Banners.fromJson(json)).toList();

      banners.clear();
      banners.addAll(newFeeds);
    } catch (e) {
      print('Error loading feeds: $e');
    }
  }
}
