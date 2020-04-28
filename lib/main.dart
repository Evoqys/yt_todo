
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yt_todo/providers/supply_provider.dart';
import 'package:yt_todo/routes.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: supplyProviders(),
      child: MaterialApp(
        title: 'Todo App',
        initialRoute: '/',
        routes: getRoutes,
      ),
    );
  }

}