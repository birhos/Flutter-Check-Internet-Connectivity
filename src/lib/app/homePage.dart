import 'package:flutter/material.dart';

import 'package:example/commonWidget/connectionCheckWidget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double widthMultiplier = (MediaQuery.of(context).size.width / 100);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Connectivity',
          style: Theme.of(context).textTheme.display1.copyWith(
                color: Colors.white,
                fontSize: 5.0 * widthMultiplier,
                fontWeight: FontWeight.bold,
              ),
        ),
        centerTitle: true,
      ),
      body: ConnectionCheckWidget(
        child: Container(
          width: widthMultiplier * 100,
          child: Center(
            child: Text(
              "İnternet Var ...",
              style: Theme.of(context).textTheme.headline5.copyWith(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
