// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qmin_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$QminStore on _QminStore, Store {
  late final _$feedsAtom = Atom(name: '_QminStore.feeds', context: context);

  @override
  ObservableList<FeedApI> get feeds {
    _$feedsAtom.reportRead();
    return super.feeds;
  }

  @override
  set feeds(ObservableList<FeedApI> value) {
    _$feedsAtom.reportWrite(value, super.feeds, () {
      super.feeds = value;
    });
  }

  late final _$bannersAtom = Atom(name: '_QminStore.banners', context: context);

  @override
  ObservableList<Banners> get banners {
    _$bannersAtom.reportRead();
    return super.banners;
  }

  @override
  set banners(ObservableList<Banners> value) {
    _$bannersAtom.reportWrite(value, super.banners, () {
      super.banners = value;
    });
  }

  late final _$currentIndexAtom =
      Atom(name: '_QminStore.currentIndex', context: context);

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  late final _$channelAtom = Atom(name: '_QminStore.channel', context: context);

  @override
  ObservableList<Channel> get channel {
    _$channelAtom.reportRead();
    return super.channel;
  }

  @override
  set channel(ObservableList<Channel> value) {
    _$channelAtom.reportWrite(value, super.channel, () {
      super.channel = value;
    });
  }

  late final _$popularAtom = Atom(name: '_QminStore.popular', context: context);

  @override
  ObservableList<PopularModel> get popular {
    _$popularAtom.reportRead();
    return super.popular;
  }

  @override
  set popular(ObservableList<PopularModel> value) {
    _$popularAtom.reportWrite(value, super.popular, () {
      super.popular = value;
    });
  }

  late final _$cardAtom = Atom(name: '_QminStore.card', context: context);

  @override
  ObservableList<CardModel> get card {
    _$cardAtom.reportRead();
    return super.card;
  }

  @override
  set card(ObservableList<CardModel> value) {
    _$cardAtom.reportWrite(value, super.card, () {
      super.card = value;
    });
  }

  late final _$loadFeedsFromJsonAsyncAction =
      AsyncAction('_QminStore.loadFeedsFromJson', context: context);

  @override
  Future<void> loadFeedsFromJson() {
    return _$loadFeedsFromJsonAsyncAction.run(() => super.loadFeedsFromJson());
  }

  late final _$loadBannersFromJsonAsyncAction =
      AsyncAction('_QminStore.loadBannersFromJson', context: context);

  @override
  Future<void> loadBannersFromJson() {
    return _$loadBannersFromJsonAsyncAction
        .run(() => super.loadBannersFromJson());
  }

  late final _$loadChannelFromJsonAsyncAction =
      AsyncAction('_QminStore.loadChannelFromJson', context: context);

  @override
  Future<void> loadChannelFromJson() {
    return _$loadChannelFromJsonAsyncAction
        .run(() => super.loadChannelFromJson());
  }

  late final _$loadPopularFromJsonAsyncAction =
      AsyncAction('_QminStore.loadPopularFromJson', context: context);

  @override
  Future<void> loadPopularFromJson() {
    return _$loadPopularFromJsonAsyncAction
        .run(() => super.loadPopularFromJson());
  }

  late final _$loadCardFromJsonAsyncAction =
      AsyncAction('_QminStore.loadCardFromJson', context: context);

  @override
  Future<void> loadCardFromJson() {
    return _$loadCardFromJsonAsyncAction.run(() => super.loadCardFromJson());
  }

  late final _$_QminStoreActionController =
      ActionController(name: '_QminStore', context: context);

  @override
  void increment(int index) {
    final _$actionInfo =
        _$_QminStoreActionController.startAction(name: '_QminStore.increment');
    try {
      return super.increment(index);
    } finally {
      _$_QminStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
feeds: ${feeds},
banners: ${banners},
currentIndex: ${currentIndex},
channel: ${channel},
popular: ${popular},
card: ${card}
    ''';
  }
}
