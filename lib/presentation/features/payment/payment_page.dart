import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/presentation/features/home/widget/home_topup_tile.dart';
import 'package:notesgram/presentation/features/payment/controller/payment_controller.dart';
import 'package:notesgram/presentation/features/payment/widget/note_subtotal_info.dart';
import 'package:notesgram/presentation/features/payment/widget/payment_summary_tile.dart';
import 'package:notesgram/presentation/features/payment/widget/payment_total_price_tile.dart';
import 'package:notesgram/presentation/features/payment/widget/promo_code_input.dart';
import 'package:notesgram/presentation/widgets/button/primary_button.dart';
import 'package:notesgram/presentation/widgets/outlined_textfield.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:remixicon/remixicon.dart';
import 'package:sizer/sizer.dart';

class PaymentPage extends GetView<PaymentController> {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Resources.color.neutral100,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: Resources.color.gradient600to800,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: TextNunito(
          text: 'Pembayaran',
          size: 15.sp,
          fontWeight: Weightenum.BOLD,
          color: Resources.color.neutral50,
        ),
        leading: IconButton(
          onPressed: () {
            controller.goBack();
          },
          icon: Icon(
            Remix.arrow_left_s_line,
            color: Resources.color.neutral50,
          ),
          iconSize: 28,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              NoteSubtotalInfo(),
              PromoCodeInput(),
              PaymentSummaryTile(),
              Card(
                elevation: 8,
                shadowColor: Resources.color.shadowColor.withOpacity(0.16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                color: Resources.color.neutral50,
                margin: const EdgeInsets.fromLTRB(0, 8, 0, 16),
                child: HomeTopUpTile(
                  onTopUpPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: PaymentTotalPriceTile(
        onSelectPaymentPressed: () {
          controller.goToSelectPayment();
        },
      ),
    );
  }
}
