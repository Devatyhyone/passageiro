import 'package:passageiro/app/modules/profile/profile_Page.dart';
import 'package:passageiro/app/modules/profile/profile_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:passageiro/app/modules/profile/repository/profile_interface.dart';
import 'package:passageiro/app/modules/profile/repository/profile_repository.dart';

class ProfileModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ProfileStore(i.get())),
    Bind.singleton<ProfileInterface>((i) => ProfileRepository()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ProfilePage()),
  ];
}
