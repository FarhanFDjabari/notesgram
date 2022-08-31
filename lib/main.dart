import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/initializer.dart';
import 'package:notesgram/theme/app_theme.dart';
import 'package:notesgram/utils/localization/app_translation.dart';
import 'package:notesgram/utils/routes/app_route.dart';
import 'package:notesgram/utils/routes/page_name.dart';
import 'package:sizer/sizer.dart';

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
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            translations: AppTranslation(),
            title: 'Notesgram',
            theme: AppTheme.buildThemeData(),
            locale: Locale('en'),
            fallbackLocale: Locale('en'),
            initialRoute: PageName.splash,
            getPages: AppRoute.pages,
            builder: (BuildContext context, child) {
              return MediaQuery(
                child: child ?? Container(),
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              );
            },
          ),
        );
      },
    );
  }
}
