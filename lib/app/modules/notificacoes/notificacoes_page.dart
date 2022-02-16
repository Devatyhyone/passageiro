import 'package:flutter_modular/flutter_modular.dart';
import 'package:passageiro/app/modules/notificacoes/notificacoes_store.dart';
import 'package:flutter/material.dart';

class NotificacoesPage extends StatefulWidget {
  final String title;
  const NotificacoesPage({Key? key, this.title = 'NotificacoesPage'}) : super(key: key);
  @override
  NotificacoesPageState createState() => NotificacoesPageState();
}
class NotificacoesPageState extends State<NotificacoesPage> {
  final NotificacoesStore store = Modular.get();

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