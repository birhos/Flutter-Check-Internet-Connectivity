import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:example/locator.dart';
import 'package:example/app/homePage.dart';
import 'package:example/blocs/connectivityBloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();

  connectivityBloc.appLaunchConnectionCheck();

  runApp(MyApp());
}

final ConnectivityBloc connectivityBloc = locator<ConnectivityBloc>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: 'Connectivity Example',
      home: HomePage(),
    );
  }
}
