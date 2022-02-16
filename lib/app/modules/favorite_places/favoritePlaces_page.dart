import 'package:flutter_modular/flutter_modular.dart';
import 'package:passageiro/app/modules/favorite_places/favoritePlaces_store.dart';
import 'package:flutter/material.dart';

class FavoritePlacesPage extends StatefulWidget {
  final String title;
  const FavoritePlacesPage({Key? key, this.title = 'FavoritePlacesPage'}) : super(key: key);
  @override
  FavoritePlacesPageState createState() => FavoritePlacesPageState();
}
class FavoritePlacesPageState extends State<FavoritePlacesPage> {
  final FavoritePlacesStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}