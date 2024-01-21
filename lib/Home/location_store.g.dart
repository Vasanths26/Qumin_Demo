// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LocationStore on _LocationStore, Store {
  late final _$locationDetailsAtom =
      Atom(name: '_LocationStore.locationDetails', context: context);

  @override
  List<String> get locationDetails {
    _$locationDetailsAtom.reportRead();
    return super.locationDetails;
  }

  @override
  set locationDetails(List<String> value) {
    _$locationDetailsAtom.reportWrite(value, super.locationDetails, () {
      super.locationDetails = value;
    });
  }

  late final _$fetchLocationDetailsAsyncAction =
      AsyncAction('_LocationStore.fetchLocationDetails', context: context);

  @override
  Future<void> fetchLocationDetails() {
    return _$fetchLocationDetailsAsyncAction
        .run(() => super.fetchLocationDetails());
  }

  @override
  String toString() {
    return '''
locationDetails: ${locationDetails}
    ''';
  }
}
