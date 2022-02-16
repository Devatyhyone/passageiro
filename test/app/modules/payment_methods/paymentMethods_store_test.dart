import 'package:flutter_test/flutter_test.dart';
import 'package:passageiro/app/modules/payment_methods/paymentMethods_store.dart';
 
void main() {
  late PaymentMethodsStore store;

  setUpAll(() {
    store = PaymentMethodsStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}