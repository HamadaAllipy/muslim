import 'package:flutter/material.dart';
import 'package:muslim/core/widgets/no_route_found.dart';
import 'package:muslim/feature/main/presentation/screen/detail_screen.dart';
import 'package:muslim/feature/main/presentation/screen/home_screen.dart';

class AppRoutes {
  const AppRoutes._();

  static const String homeRoute = '/';
  static const String detailRoute = '/detail';
}

class RouteGenerator {
  static Route<dynamic> generate(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeRoute:
        return _move(const MainScreen());
      case AppRoutes.detailRoute:
        ScrollController controller = settings.arguments as ScrollController;
        return _move( DetailScreen(controller: controller,));
      default:
        return _move(const NoRouteFound());
    }
  }

  static PageRoute _move(Widget view) => MaterialPageRoute(
        builder: (_) => view,
      );
}
