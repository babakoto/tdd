import 'package:clean_tdd_bloc/presentation/pages/detail/detail_page.dart';
import 'package:clean_tdd_bloc/presentation/pages/home/home_page.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static String home = "/";
  static String detail = "/detail";
  static Map<String, WidgetBuilder> routes = {
    home: (BuildContext context) => const HomePage(),
    detail: (BuildContext context) => const DetailPage(),
  };
}
