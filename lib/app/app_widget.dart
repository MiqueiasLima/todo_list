import 'package:asp_arch/routes.dart';
import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';

class AppWidget extends StatelessWidget{

  const AppWidget({super.key});

  @override
  Widget build(BuildContext context){
    return  MaterialApp.router(
      title: 'ASP Arch',
      routerConfig: Routefly.routerConfig(
        routes: routes,
        initialPath: routePaths.splash,
      ),
    );
  }
}