// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feeds_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FeedStore on _FeedStore, Store {
  late final _$feedsAtom = Atom(name: '_FeedStore.feeds', context: context);

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

  late final _$loadFeedsFromJsonAsyncAction =
      AsyncAction('_FeedStore.loadFeedsFromJson', context: context);

  @override
  Future<void> loadFeedsFromJson() {
    return _$loadFeedsFromJsonAsyncAction.run(() => super.loadFeedsFromJson());
  }

  @override
  String toString() {
    return '''
feeds: ${feeds}
    ''';
  }
}
