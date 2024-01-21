// ignore_for_file: avoid_print

import 'dart:convert';

import 'feed_model.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';

part 'feeds_store.g.dart';

// ignore: library_private_types_in_public_api
class FeedStore = _FeedStore with _$FeedStore;

abstract class _FeedStore with Store {
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
}
