import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:notesgram/presentation/features/payment/controller/payment_controller.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/theme/resources/gen/assets.gen.dart';
import 'package:notesgram/utils/helpers/constant.dart';

class PaymentProcessingPage extends GetView<PaymentController> {
  const PaymentProcessingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentController>(
      init: PaymentController(),
      initState: (_) {
        controller.processPayment();
      },
      builder: (_) {
        return Scaffold(
          backgroundColor: Resources.color.neutral50,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LottieBuilder.asset(
                  Assets.lib.theme.resources.animations.customLoading,
                  width: 120,
                  height: 120,
                  alignment: Alignment.center,
                ),
                const SizedBox(height: 24),
                TextNunito(
                  text: 'Memproses Pembayaran',
                  fontWeight: Weightenum.BOLD,
                  size: 20,
                  color: Resources.color.indigo900,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
