import 'package:flutter_modular/flutter_modular.dart';
import 'package:passageiro/app/modules/viagens/viagens_store.dart';
import 'package:flutter/material.dart';

class ViagensPage extends StatefulWidget {
  final String title;
  const ViagensPage({Key? key, this.title = 'ViagensPage'}) : super(key: key);
  @override
  ViagensPageState createState() => ViagensPageState();
}
class ViagensPageState extends State<ViagensPage> {
  final ViagensStore store = Modular.get();

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