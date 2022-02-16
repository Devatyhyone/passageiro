import 'package:passageiro/app/modules/cadastro/cadastro_Page.dart';
import 'package:passageiro/app/modules/cadastro/cadastro_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:passageiro/app/modules/cadastro/repository/cadastro_interface.dart';
import 'package:passageiro/app/modules/cadastro/repository/cadastro_repository.dart';

class CadastroModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CadastroStore(i.get())),
    Bind.singleton<CadastroInterface>((i) => CadastroRepository()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => CadastroPage()),
  ];
}
