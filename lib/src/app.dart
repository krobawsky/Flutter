import 'package:flutter/material.dart';

import 'package:demoapp/src/pages/home_page.dart';
import 'package:demoapp/src/routes/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'), // English
        const Locale('es'), // Españish
      ],
      // home: ContadorPage(),
      // home: HomePage(),
      // home: ListPage(),
      initialRoute: '/',
      routes: getApplicationRoutes(),
      onGenerateRoute: ( RouteSettings settings ){
        return MaterialPageRoute(builder: (BuildContext context) => HomePage());
      },
    );
  }

}