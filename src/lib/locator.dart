import 'package:get_it/get_it.dart';

import 'package:example/blocs/connectivityBloc.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton(ConnectivityBloc());
}
