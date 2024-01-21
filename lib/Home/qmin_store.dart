// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'dart:convert';

import 'package:app_data/Home/channel/channel_model.dart';
import 'package:app_data/Home/custom_channel/card_model.dart';
import 'package:app_data/Home/feeds/feed_model.dart';
import 'package:app_data/Home/banner/banner_model.dart';
import 'package:app_data/Home/popular/popular_model.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';

part 'qmin_store.g.dart';

class QminStore = _QminStore with _$QminStore;

abstract class _QminStore with Store {
  @observable
  ObservableList<FeedApI> feeds = ObservableList<FeedApI>();

  @action
  Future<void> loadFeedsFromJson() async {
    try {
      final String jsonString =
          await rootBundle.loadString('assets/newdart/feed.json');
      final List<dynamic> jsonList = json.decode(jsonString);
      final List<FeedApI> newFeeds =
          jsonList.map((json) => FeedApI.fromJson(json)).toList();

      feeds.clear();
      feeds.addAll(newFeeds);
    } catch (e) {
      print('Error loading feeds: $e');
    }
  }

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
      final List<Banners> newBanners =
          jsonList.map((json) => Banners.fromJson(json)).toList();

      banners.clear();
      banners.addAll(newBanners);
    } catch (e) {
      print('Error loading feeds: $e');
    }
  }

  @observable
  ObservableList<Channel> channel = ObservableList<Channel>();

  @action
  Future<void> loadChannelFromJson() async {
    try {
      final String jsonString =
          await rootBundle.loadString('assets/newdart/channel.json');
      final List<dynamic> jsonList = json.decode(jsonString);
      final List<Channel> newChannel =
          jsonList.map((json) => Channel.fromJson(json)).toList();

      channel.clear();
      channel.addAll(newChannel);
      //print('Error loading feeds: $channel');
    } catch (e) {
      print('Error loading feeds: $e');
    }
  }

  @observable
  ObservableList<PopularModel> popular = ObservableList<PopularModel>();

  @action
  Future<void> loadPopularFromJson() async {
    try {
      final String jsonString =
          await rootBundle.loadString('assets/newdart/popular.json');
      final List<dynamic> jsonList = json.decode(jsonString);
      final List<PopularModel> newPopular =
          jsonList.map((json) => PopularModel.fromJson(json)).toList();

      popular.clear();
      popular.addAll(newPopular);
    } catch (e) {
      print('Error loading feeds: $e');
    }
  }

  @observable
  ObservableList<CardModel> card = ObservableList<CardModel>();

  @action
  Future<void> loadCardFromJson() async {
    try {
      final String jsonString =
          await rootBundle.loadString('assets/newdart/card.json');
      final List<dynamic> jsonList = json.decode(jsonString);
      final List<CardModel> newCard =
          jsonList.map((json) => CardModel.fromJson(json)).toList();

      card.clear();
      card.addAll(newCard);
    } catch (e) {
      print('Error loading feeds: $e');
    }
  }
}
