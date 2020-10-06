import 'package:bcgdvtest/app.dart';
import 'package:bcgdvtest/src/services/service_injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    initInjectService();
    runApp(App());
  });
}
