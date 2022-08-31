import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/presentation/features/splash/controllers/splash_controller.dart';
import 'package:notesgram/presentation/widgets/statefull_wrapper.dart';
import 'package:notesgram/theme/resources/gen/assets.gen.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(
      onInit: () {
        controller.initSplash();
      },
      child: Scaffold(
        body: Center(
          child: Image.asset(
            Assets.lib.theme.resources.images.appLogo.path,
            width: 88,
            height: 88,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
