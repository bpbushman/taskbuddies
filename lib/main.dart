import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:taskbuddies/app/locator.dart';
import 'package:taskbuddies/app/router.gr.dart';

Future<void> main() async {
  setupLocator();
  try {
    await futureLocator();
  } catch (error) {
    print('error');
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.startUpView,
      onGenerateRoute: MyRouter().onGenerateRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,
      theme: ThemeData(
          backgroundColor: Colors.purple,
          scaffoldBackgroundColor: Colors.purple,
          primarySwatch: Colors.orange,
          //accentColor: Colors.lightGreen,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Retro'),
    );
  }
}

//heart icon: Heart by Alice Noir from the Noun Project
//comment icon: pixelated speech bubble by George Serov from the Noun Project
//world: pixelated planet earth by Jamison Wieser from the Noun Project
//home: House by Maxim David from the Noun Project
//hand: Hand Left Excellent by stefan wetterstrand. from the Noun Project
