import 'package:flutter_test/flutter_test.dart';
import 'package:passageiro/app/modules/viagens/viagens_store.dart';
 
void main() {
  late ViagensStore store;

  setUpAll(() {
    store = ViagensStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}