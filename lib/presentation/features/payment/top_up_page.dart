import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/presentation/features/payment/controller/payment_topup_controller.dart';
import 'package:notesgram/presentation/features/payment/widget/payment_coin_info_tile.dart';
import 'package:notesgram/presentation/widgets/button/primary_button.dart';
import 'package:notesgram/presentation/widgets/outlined_textfield.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:remixicon/remixicon.dart';
import 'package:sizer/sizer.dart';

class TopUpPage extends GetView<PaymentTopupController> {
  TopUpPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

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
          text: 'Top Up',
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
              PaymentCoinInfoTile(),
              const SizedBox(height: 16),
              Form(
                key: _formKey,
                child: OutlinedTextfield(
                  controller: controller.topUpAmountController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  label: TextNunito(
                    text: 'Masukkan nominal',
                    size: 14,
                    fontWeight: Weightenum.REGULAR,
                  ),
                  hintText: 'Minimal top up Rp15.000',
                  validator: (value) {
                    if (int.parse(value ?? "0") < 15000) {
                      return 'Minimal top up 15.000';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 4),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    controller.showTermsDialog(
                      title: 'Ketentuan top up',
                      terms: [
                        'Setiap top up akan dikenakan biaya layanan sebesar Rp500',
                        'Jumlah minimal penarikan adalah Rp15.000',
                        'Besaran konversi penarikan senilai 1:1. Jika Anda melakukan penarikan sebesar Rp15.000 Koin, Anda akan mendapatkan 15.000 koin',
                      ],
                    );
                  },
                  child: TextNunito(
                    text: 'Ketentuan top up',
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
                label: 'TOP UP',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    controller.topUpCoin();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
