import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:seki_birthday/consts/consts.dart';
import 'package:seki_birthday/controllers/setting_controller.dart';
import 'package:seki_birthday/views/screens/splash_screen.dart';
import 'package:seki_birthday/controllers/map_controller.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        primaryColor: AppColors.primaryColor,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: AppColors.primaryColor,
        ),
      ),
      title: AppTexts.appName,
      onGenerateRoute: (settings) {
        final routes = <String, WidgetBuilder>{
          // PsScheduleScreen.route: (BuildContext context) =>
          //     PsScheduleScreen(settings.arguments),
        };
        WidgetBuilder? builder = routes[settings.name];
        return MaterialPageRoute(builder: (context) => builder!(context));
      },
      onInit: () {
        Get.put(SettingController());
        Get.put(MapController());
      },
      home: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  SettingController settingController = Get.find();

  var hasNotification = false;

  late Map arguments;

  @override
  void initState() {
    super.initState();

    settingController.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}
