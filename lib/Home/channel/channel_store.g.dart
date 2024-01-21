// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChannelStore on _ChannelStore, Store {
  late final _$channelAtom =
      Atom(name: '_ChannelStore.channel', context: context);

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

  late final _$loadChannelFromJsonAsyncAction =
      AsyncAction('_ChannelStore.loadChannelFromJson', context: context);

  @override
  Future<void> loadChannelFromJson() {
    return _$loadChannelFromJsonAsyncAction
        .run(() => super.loadChannelFromJson());
  }

  @override
  String toString() {
    return '''
channel: ${channel}
    ''';
  }
}
