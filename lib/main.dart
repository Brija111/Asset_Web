import 'dart:html';

import 'package:asset_management/locator.dart';
import 'package:asset_management/router.dart';
import 'package:asset_management/services/shared/dialog_service.dart';
import 'package:asset_management/services/shared/navigator_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'core/res/styles.dart';
import 'helper/dialog_manager.dart';

Future<Null> main() async {

  setupLocator();

  WidgetsFlutterBinding.ensureInitialized();

    runApp(MyApp());

}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final navigationService = locator<NavigationService>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));

    return ScreenUtilInit(
      designSize: Size(360, 640),
      builder:(BuildContext context,_)=> MaterialApp(
        title: "",
        theme: AppStyle.appTheme,
        builder: _setupDialogManager,
        initialRoute:  '/main',
        debugShowCheckedModeBanner: false,
        navigatorKey: navigationService.navigatorKey,
        onGenerateRoute: (settings) => AppRouter.generateRoute(settings),
        // navigatorObservers: [FirebaseAnalyticsObserver(analytics: analytics)],
      ),
    );
  }

  Widget _setupDialogManager(context, widget) {
    return Navigator(
      key: locator<DialogService>().dialogNavigationKey,
      onGenerateRoute: (settings) => MaterialPageRoute(builder: (context) {
        final MediaQueryData data = MediaQuery.of(context);
        return DialogManager(
          child: MediaQuery(
            data: data.copyWith(textScaleFactor: 1.0),
            child: widget,
          ),
        );
      }),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}