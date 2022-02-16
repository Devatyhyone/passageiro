import 'package:passageiro/app/modules/login/login_Page.dart';
import 'package:passageiro/app/modules/login/login_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:passageiro/app/modules/login/repository/login_interface.dart';
import 'package:passageiro/app/modules/login/repository/login_repository.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LoginStore(i.get())),
    Bind.singleton<LoginInterface>((i) => LoginRepository()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => LoginPage()),
  ];
}
