import 'package:flutter_test/flutter_test.dart';
import 'package:passageiro/app/modules/cadastro/cadastro_store.dart';
 
void main() {
  late CadastroStore store;

  setUpAll(() {
    store = CadastroStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}