import 'package:flutter_modular/flutter_modular.dart';
import 'package:passageiro/app/modules/payment_methods/paymentMethods_store.dart';
import 'package:flutter/material.dart';

class PaymentMethodsPage extends StatefulWidget {
  final String title;
  const PaymentMethodsPage({Key? key, this.title = 'PaymentMethodsPage'}) : super(key: key);
  @override
  PaymentMethodsPageState createState() => PaymentMethodsPageState();
}
class PaymentMethodsPageState extends State<PaymentMethodsPage> {
  final PaymentMethodsStore store = Modular.get();

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