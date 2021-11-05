import 'package:flutter/material.dart';

import 'package:flutter_componentes/src/pages/alert_page.dart';
import 'package:flutter_componentes/src/pages/avatar_page.dart';
import 'package:flutter_componentes/src/pages/card_pages.dart';
import 'package:flutter_componentes/src/pages/home_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (context) => HomePage(),
    'alert': (context) => AlertPage(),
    'avatar': (context) => AvatarPage(),
    'card': (context) => CardPage(),
  };
}
