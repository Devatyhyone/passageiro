import 'package:mobx/mobx.dart';

part 'paymentMethods_store.g.dart';

class PaymentMethodsStore = _PaymentMethodsStoreBase with _$PaymentMethodsStore;
abstract class _PaymentMethodsStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}