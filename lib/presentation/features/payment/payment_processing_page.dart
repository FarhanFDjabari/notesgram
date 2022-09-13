import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/presentation/features/payment/controller/payment_controller.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
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
                SizedBox(
                  width: 100,
                  height: 100,
                  child: CircularProgressIndicator(
                    strokeWidth: 10,
                    backgroundColor:
                        Resources.color.indigo600.withOpacity(0.15),
                    color: Resources.color.indigo600,
                  ),
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
