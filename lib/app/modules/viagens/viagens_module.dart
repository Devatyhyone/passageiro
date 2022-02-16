import 'package:passageiro/app/modules/viagens/viagens_Page.dart';
import 'package:passageiro/app/modules/viagens/viagens_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ViagensModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ViagensStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ViagensPage()),
  ];
}
