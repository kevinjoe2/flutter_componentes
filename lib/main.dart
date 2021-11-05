import 'package:flutter/material.dart';

import 'package:flutter_componentes/src/routes/routes.dart';
import 'package:flutter_componentes/src/pages/alert_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes App',
      debugShowCheckedModeBanner: false,
      //home: HomePage(),
      initialRoute: '/',
      routes: getApplicationRoutes(),
      onGenerateRoute: (setting) {
        print( "onGenerateRoute" );
        return MaterialPageRoute(
          builder: (context) => AlertPage()
        );
      },
    );
  }
}