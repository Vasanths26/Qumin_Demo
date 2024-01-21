// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';

import 'card_model.dart';

part 'card_store.g.dart';

// ignore: library_private_types_in_public_api
class CardStore = _CardStore with _$CardStore;

abstract class _CardStore with Store {
  @observable
  ObservableList<CardModel> card = ObservableList<CardModel>();

  @action
  Future<void> loadCardFromJson() async {
    try {
      final String jsonString =
          await rootBundle.loadString('assets/newdart/card.json');
      final List<dynamic> jsonList = json.decode(jsonString);
      final List<CardModel> newFeeds =
          jsonList.map((json) => CardModel.fromJson(json)).toList();

      card.clear();
      card.addAll(newFeeds);
    } catch (e) {
      print('Error loading feeds: $e');
    }
  }
}
