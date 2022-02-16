// ignore_for_file: prefer_const_constructors

import 'package:flutter_modular/flutter_modular.dart';
import 'package:passageiro/app/modules/splash/splash_store.dart';
import 'package:flutter/material.dart';
import 'package:passageiro/app/shared/core/app_assets.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key? key, this.title = 'SplashPage'}) : super(key: key);
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  final SplashStore store = Modular.get();

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 4),
      () => Modular.to.pushReplacementNamed('/login/'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage(AppAssets.bgSplash))),
    );
  }
}
