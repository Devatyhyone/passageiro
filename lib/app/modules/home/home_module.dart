import 'package:flutter_modular/flutter_modular.dart';
import 'package:passageiro/app/modules/home/repository/home_interface.dart';
import 'package:passageiro/app/modules/home/repository/home_repository.dart';
import '../home/home_store.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore(i.get())),
    Bind.singleton<HomeInterface>((i) => HomeRepository()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
  ];
}
