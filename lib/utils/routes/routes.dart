import 'package:cms_news/utils/routes/routes_name.dart';
import 'package:cms_news/view/breakingnews_page.dart';
import 'package:cms_news/view/home/home_page.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      case RoutesName.homepage:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomePage());

      case RoutesName.breakingpage:
        return MaterialPageRoute(
            builder: (BuildContext context) => const BreakingNews());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
