import 'package:mobx/mobx.dart';

part 'notificacoes_store.g.dart';

class NotificacoesStore = _NotificacoesStoreBase with _$NotificacoesStore;
abstract class _NotificacoesStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}