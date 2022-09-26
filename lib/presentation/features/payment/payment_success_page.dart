import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/presentation/features/payment/controller/payment_success_controller.dart';
import 'package:notesgram/presentation/features/payment/widget/note_subtotal_info.dart';
import 'package:notesgram/presentation/features/payment/widget/payment_success_coupon.dart';
import 'package:notesgram/presentation/widgets/button/custom_text_button.dart';
import 'package:notesgram/presentation/widgets/button/primary_button.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/theme/resources/gen/assets.gen.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:remixicon/remixicon.dart';
import 'package:sizer/sizer.dart';

class PaymentSuccessPage extends GetView<PaymentSuccessController> {
  const PaymentSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: Resources.color.gradient600to800,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Assets.lib.theme.resources.images.appLogoMonochrome.image(
          width: 32,
          height: 32,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              PaymentSuccessCoupon(),
              const SizedBox(height: 24),
              NoteSubtotalInfo(isPaymentSuccess: true),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomTextButton(
              width: 110,
              height: 48,
              label: 'KEMBALI',
              labelWeight: Weightenum.BOLD,
              labelSize: 16,
              onPressed: () {
                controller.goToHome();
              },
            ),
            const SizedBox(width: 16),
            PrimaryButton(
              width: 130.sp,
              height: 35.sp,
              label: 'LIHAT CATATAN',
              fontSize: 12.sp,
              elevation: 0,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
