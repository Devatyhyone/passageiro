import 'package:passageiro/app/modules/notificacoes/notificacoes_Page.dart';
import 'package:passageiro/app/modules/notificacoes/notificacoes_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NotificacoesModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => NotificacoesStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => NotificacoesPage()),
  ];
}
