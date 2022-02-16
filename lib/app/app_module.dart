import 'package:flutter_modular/flutter_modular.dart';

import 'modules/cadastro/cadastro_module.dart';
import 'modules/favorite_places/favoritePlaces_module.dart';
import 'modules/home/home_module.dart';
import 'modules/login/login_module.dart';
import 'modules/notificacoes/notificacoes_module.dart';
import 'modules/payment_methods/paymentMethods_module.dart';
import 'modules/profile/profile_module.dart';
import 'modules/splash/splash_module.dart';
import 'modules/viagens/viagens_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: SplashModule()),
    ModuleRoute('/splash/', module: SplashModule()),
    ModuleRoute('/login/', module: LoginModule()),
    ModuleRoute('/cadastro/', module: CadastroModule()),
    ModuleRoute('/favorites/', module: FavoritePlacesModule()),
    ModuleRoute('/home/', module: HomeModule()),
    ModuleRoute('/notificacoes/', module: NotificacoesModule()),
    ModuleRoute('/payments/', module: PaymentMethodsModule()),
    ModuleRoute('/profile/', module: ProfileModule()),
    ModuleRoute('/viagens/', module: ViagensModule()),
  ];
}
