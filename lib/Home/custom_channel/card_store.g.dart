// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CardStore on _CardStore, Store {
  late final _$cardAtom = Atom(name: '_CardStore.card', context: context);

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

  late final _$loadCardFromJsonAsyncAction =
      AsyncAction('_CardStore.loadCardFromJson', context: context);

  @override
  Future<void> loadCardFromJson() {
    return _$loadCardFromJsonAsyncAction.run(() => super.loadCardFromJson());
  }

  @override
  String toString() {
    return '''
card: ${card}
    ''';
  }
}
