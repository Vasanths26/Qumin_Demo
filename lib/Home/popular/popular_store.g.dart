// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PopularStore on _PopularStore, Store {
  late final _$popularAtom =
      Atom(name: '_PopularStore.popular', context: context);

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

  late final _$loadPopularFromJsonAsyncAction =
      AsyncAction('_PopularStore.loadPopularFromJson', context: context);

  @override
  Future<void> loadPopularFromJson() {
    return _$loadPopularFromJsonAsyncAction
        .run(() => super.loadPopularFromJson());
  }

  @override
  String toString() {
    return '''
popular: ${popular}
    ''';
  }
}
