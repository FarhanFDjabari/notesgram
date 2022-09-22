import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/presentation/features/payment/controller/payment_controller.dart';
import 'package:notesgram/presentation/features/payment/widget/payment_coin_info_tile.dart';
import 'package:notesgram/presentation/widgets/button/primary_button.dart';
import 'package:notesgram/presentation/widgets/outlined_textfield.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:remixicon/remixicon.dart';
import 'package:sizer/sizer.dart';

class WithdrawPage extends GetView<PaymentController> {
  const WithdrawPage({Key? key}) : super(key: key);

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
          text: 'Penarikan',
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OutlinedTextfield(
                controller: controller.recipientNumberController,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                label: TextNunito(
                  text: 'Masukkan no. HP atau rekening',
                  size: 14,
                  fontWeight: Weightenum.REGULAR,
                ),
                hintText: 'e.g. 081234567890',
              ),
              const SizedBox(height: 16),
              PaymentCoinInfoTile(),
              const SizedBox(height: 16),
              OutlinedTextfield(
                controller: controller.withdrawAmountController,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                label: TextNunito(
                  text: 'Masukkan nominal',
                  size: 14,
                  fontWeight: Weightenum.REGULAR,
                ),
                hintText: 'Minimal penarikan 50.000 Koin',
              ),
              const SizedBox(height: 4),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {},
                  child: TextNunito(
                    text: 'Ketentuan penarikan',
                    size: 14,
                    fontWeight: Weightenum.BOLD,
                    color: Resources.color.indigo700,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              PrimaryButton(
                elevation: 0,
                isLoading: controller.isLoading,
                label: 'TARIK SALDO',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
