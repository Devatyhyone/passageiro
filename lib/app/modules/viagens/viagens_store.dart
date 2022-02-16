import 'package:mobx/mobx.dart';

part 'viagens_store.g.dart';

class ViagensStore = _ViagensStoreBase with _$ViagensStore;
abstract class _ViagensStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}