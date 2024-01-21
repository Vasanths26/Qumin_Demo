// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BannerStore on _BannerStore, Store {
  late final _$bannersAtom =
      Atom(name: '_BannerStore.banners', context: context);

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
      Atom(name: '_BannerStore.currentIndex', context: context);

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

  late final _$loadBannersFromJsonAsyncAction =
      AsyncAction('_BannerStore.loadBannersFromJson', context: context);

  @override
  Future<void> loadBannersFromJson() {
    return _$loadBannersFromJsonAsyncAction
        .run(() => super.loadBannersFromJson());
  }

  late final _$_BannerStoreActionController =
      ActionController(name: '_BannerStore', context: context);

  @override
  void increment(int index) {
    final _$actionInfo = _$_BannerStoreActionController.startAction(
        name: '_BannerStore.increment');
    try {
      return super.increment(index);
    } finally {
      _$_BannerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
banners: ${banners},
currentIndex: ${currentIndex}
    ''';
  }
}
