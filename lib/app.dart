import 'package:bcgdvtest/src/const/App_const.dart';
import 'package:bcgdvtest/src/screen/home/home_screen.dart';
import 'package:bcgdvtest/src/screen/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.rootScreen,
      routes: {
        AppRoute.rootScreen: (context) => MultiProvider(
              providers: [
                ListenableProvider<HomeViewModel>(
                    create: (_) => HomeViewModel())
              ],
              child: HomeScreen(),
            )
      },
    );
  }
}
