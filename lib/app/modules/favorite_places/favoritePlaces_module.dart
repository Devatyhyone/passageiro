import 'package:passageiro/app/modules/favorite_places/favoritePlaces_Page.dart';
import 'package:passageiro/app/modules/favorite_places/favoritePlaces_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FavoritePlacesModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => FavoritePlacesStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => FavoritePlacesPage()),
  ];
}
