import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:jot_timer/app/core/ui/app_configUI.dart';

class AppWidget extends StatelessWidget {

  const AppWidget({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return MaterialApp.router(
         title: 'JobTimer',
         builder: asuka.builder,
         theme: AppConfigUI.theme, routeInformationParser: Modular.routeInformationParser, routerDelegate: Modular.routerDelegate);
  }
}