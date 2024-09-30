import 'package:asp_arch/app/(public)/home_page.dart' as a1;
import 'package:asp_arch/app/(public)/splash_page.dart' as a0;
import 'package:routefly/routefly.dart';

List<RouteEntity> get routes => [
      RouteEntity(
          uri: Uri.parse("/splash"),
          routeBuilder: (context, setting) =>
              Routefly.defaultRouteBuilder(
                  context,
                  setting,
                  const a0.SplashPage()
              ),
          key: '/splash'),
      RouteEntity(
          uri: Uri.parse("/home"),
          routeBuilder: (context, setting) =>
              Routefly.defaultRouteBuilder(
                context,
                setting,
                const a1.HomePage()
              ),
          key: "/home")
    ];

const routePaths = (path: '/', home: '/home', splash: '/splash');
