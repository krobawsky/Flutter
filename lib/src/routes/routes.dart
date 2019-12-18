import 'package:demoapp/src/pages/animated_container.dart';
import 'package:demoapp/src/pages/input_page.dart';
import 'package:demoapp/src/pages/listview_page.dart';
import 'package:demoapp/src/pages/slider_page.dart';
import 'package:flutter/material.dart';

import 'package:demoapp/src/pages/card_page.dart';
import 'package:demoapp/src/pages/alert_page.dart';
import 'package:demoapp/src/pages/avatar_page.dart';

import 'package:demoapp/src/pages/list_page.dart';
import 'package:demoapp/src/pages/contador_page.dart';
import 'package:demoapp/src/pages/home_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {

  return <String, WidgetBuilder>{
        '/'       : (BuildContext context) => ListPage(),
        'alert'   : (BuildContext context) => AlertPage(),
        'avatar'  : (BuildContext context) => AvatarPage(),
        'card'  : (BuildContext context) => CardPage(),
        'animated'  : (BuildContext context) => AnimatedContainerPage(),
        'inputs'  : (BuildContext context) => InputPage(),
        'counter'  : (BuildContext context) => ContadorPage(),
        'slider'  : (BuildContext context) => SliderPage(),
        'list'  : (BuildContext context) => ListviewPage(),
  };

}