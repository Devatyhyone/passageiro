import 'package:passageiro/app/modules/payment_methods/paymentMethods_Page.dart';
import 'package:passageiro/app/modules/payment_methods/paymentMethods_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PaymentMethodsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => PaymentMethodsStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => PaymentMethodsPage()),
  ];
}
