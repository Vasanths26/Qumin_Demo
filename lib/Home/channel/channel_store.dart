// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';

import 'channel_model.dart';

part 'channel_store.g.dart';

class ChannelStore = _ChannelStore with _$ChannelStore;

abstract class _ChannelStore with Store {
  @observable
  ObservableList<Channel> channel = ObservableList<Channel>();

  @action
  Future<void> loadChannelFromJson() async {
    try {
      final String jsonString =
          await rootBundle.loadString('assets/newdart/channel.json');
      final List<dynamic> jsonList = json.decode(jsonString);
      final List<Channel> newFeeds =
          jsonList.map((json) => Channel.fromJson(json)).toList();

      channel.clear();
      channel.addAll(newFeeds);
      //print('Error loading feeds: $channel');
    } catch (e) {
      print('Error loading feeds: $e');
    }
  }
}
