import 'package:mobx/mobx.dart';

part 'favoritePlaces_store.g.dart';

class FavoritePlacesStore = _FavoritePlacesStoreBase with _$FavoritePlacesStore;
abstract class _FavoritePlacesStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}