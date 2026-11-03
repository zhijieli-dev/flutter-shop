import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/Main/index.dart';
import 'package:flutter_shop/pages/Login/index.dart';


Widget getRootWidget() {
  return MaterialApp(
      initialRoute: '/',
      routes: getRootRoutes()
    );
}

Map<String, Widget Function(BuildContext)> getRootRoutes() {
  return {
    '/': (context) => const MainPage(),
    '/login': (context) => const LoginPage()
  };
}