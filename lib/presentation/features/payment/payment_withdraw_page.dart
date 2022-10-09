import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/presentation/features/payment/controller/payment_withdraw_controller.dart';
import 'package:notesgram/presentation/features/payment/widget/payment_coin_info_tile.dart';
import 'package:notesgram/presentation/widgets/button/primary_button.dart';
import 'package:notesgram/presentation/widgets/loading_overlay.dart';
import 'package:notesgram/presentation/widgets/outlined_textfield.dart';
import 'package:notesgram/presentation/widgets/state_handle_widget.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:notesgram/utils/helpers/validator.dart';
import 'package:remixicon/remixicon.dart';
import 'package:sizer/sizer.dart';

class WithdrawPage extends GetView<PaymentWithdrawController> {
  WithdrawPage({Key? key}) : super(key: key);
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
        child: StateHandleWidget(
          shimmerView: LoadingOverlay(),
          loadingEnabled: controller.isLoading,
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
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
                    validator: Validator().phone,
                  ),
                  const SizedBox(height: 16),
                  GetX<PaymentWithdrawController>(
                    init: PaymentWithdrawController(),
                    initState: (_) {},
                    builder: (_) {
                      return PaymentCoinInfoTile(
                        coins: controller.coins.value,
                      );
                    },
                  ),
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
                    validator: (value) {
                      if (value?.isNotEmpty == true) {
                        if (int.parse(value ?? "0") < 50000) {
                          return 'Minimal penarikan 50.000';
                        }
                      } else if (value?.isEmpty == true) {
                        return 'txt_valid_notEmpty'.tr;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 4),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        controller.showTermsDialog(
                          title: 'Ketentuan penarikan',
                          terms: [
                            'Penarikan hanya dapat dilakukan melalui Bank BNI, Mandiri, BCA, dan BRI',
                            'Setiap top up akan dikenakan biaya layanan sebesar Rp500',
                            'Jumlah minimal penarikan adalah 15.000 Koin',
                            'Besaran konversi penarikan senilai 1:1. Jika Anda melakukan penarikan sebesar 50.000 Koin, Anda akan mendapatkan Rp50.000',
                            'Saldo akan dikirimkan dalam kurun waktu 1x24 jam'
                          ],
                        );
                      },
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
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
