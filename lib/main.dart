import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''), // English, no country code
        Locale('es', ''), // Spanish, no country code
      ],
      initialRoute: '/',
      routes: getApplicationRoutes(),
      onGenerateRoute: (setting) {
        //print( "onGenerateRoute" );
        return MaterialPageRoute(
          builder: (context) => AlertPage()
        );
      },
    );
  }
}