import 'package:client/utils/appRouter.dart';
import 'package:client/utils/locales.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/bindings/bindingController.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(PlaceXClientApp());
}

class PlaceXClientApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'placeX Client',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.orange,
      ),

      translations: Locales(),
      locale: Locale('en'),
      initialBinding: BindingController(),
      onGenerateRoute: AppRouter.generateGlobalRoutes,
      initialRoute: AppRouter.splashRoute,
    );
  }
}
