import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/initializer.dart';
import 'package:notesgram/theme/app_theme.dart';
import 'package:notesgram/utils/routes/app_route.dart';
import 'package:notesgram/utils/routes/page_name.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Initializer.init();
  await Initializer.initHive();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Notesgram',
        theme: AppTheme.buildThemeData(),
        initialRoute: PageName.splash,
        getPages: AppRoute.pages,
      ),
    );
  }
}
