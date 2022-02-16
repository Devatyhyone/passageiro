import 'package:flutter_test/flutter_test.dart';
import 'package:passageiro/app/modules/notificacoes/notificacoes_store.dart';
 
void main() {
  late NotificacoesStore store;

  setUpAll(() {
    store = NotificacoesStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}