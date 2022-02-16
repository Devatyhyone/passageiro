import 'package:flutter_test/flutter_test.dart';
import 'package:passageiro/app/modules/favorite_places/favoritePlaces_store.dart';
 
void main() {
  late FavoritePlacesStore store;

  setUpAll(() {
    store = FavoritePlacesStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}