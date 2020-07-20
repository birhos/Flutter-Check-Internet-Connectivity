import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:connectivity/connectivity.dart';

import 'package:example/main.dart';

class ConnectionCheckWidget extends StatelessWidget {
  final Widget child;

  const ConnectionCheckWidget({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: connectivityBloc.stream,
      initialData: connectivityBloc.connectionStatus,
      builder: (BuildContext context, AsyncSnapshot<Object> snapshot) {
        return snapshot.data == ConnectivityResult.mobile ||
                snapshot.data == ConnectivityResult.wifi
            ? child
            : ConnectionOfflineWidget();
      },
    );
  }
}

class ConnectionOfflineWidget extends StatelessWidget {
  const ConnectionOfflineWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthMultiplier = (MediaQuery.of(context).size.width / 100);

    return Center(
      child: Padding(
        padding: EdgeInsets.all(
          2.5 * widthMultiplier,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // ************************** **************************

            Center(
              child: SvgPicture.asset(
                "assets/images/connectionNoneImages.svg",
                semanticsLabel: 'İnternet Bağlantısı Yok',
                width: 30.0 * widthMultiplier,
                color: Colors.white,
                colorBlendMode: BlendMode.srcIn,
                allowDrawingOutsideViewBox: true,
              ),
            ),

            // ************************** **************************

            SizedBox(
              height: 2.0 * widthMultiplier,
            ),

            // ************************** **************************

            Text(
              "İnternet Bağlantısı Yok",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),

            // ************************** **************************

            SizedBox(
              height: 0.5 * widthMultiplier,
            ),

            // ************************** **************************

            Text(
              "Ağ ayarlarını kontrol etmeyi dene.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: Colors.white70,
                    fontWeight: FontWeight.w300,
                  ),
            ),

            // ************************** **************************
          ],
        ),
      ),
    );
  }
}
