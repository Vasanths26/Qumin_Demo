// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';

part 'appetizer_store.g.dart';

class AppetizerStore = _AppetizerStore with _$AppetizerStore;

abstract class _AppetizerStore with Store {
  @observable
  bool _isExpand = true;

  @action
  bool expand() {
    return _isExpand = true;
  }

  @action
  bool toggleExpand() {
    return _isExpand = !_isExpand;
  }
}
