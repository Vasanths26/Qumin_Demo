import 'package:mobx/mobx.dart';

part 'cart_store.g.dart';

class CartPage = _CartPage with _$CartPage;

abstract class _CartPage with Store {
  @observable
  int count = 0;
  
  @action
  void add() {
    count++;
  }

  @action
  void remove() {
    count--;
  }
}
