import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/presentation/features/payment/controller/payment_controller.dart';
import 'package:notesgram/presentation/widgets/outlined_textfield.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:sizer/sizer.dart';

class PromoCodeInput extends GetView<PaymentController> {
  const PromoCodeInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shadowColor: Resources.color.shadowColor.withOpacity(0.16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      color: Resources.color.neutral50,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: SizerUtil.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OutlinedTextfield(
                controller: controller.promoCodeController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                label: TextNunito(
                  text: 'Kode promo',
                  size: 16,
                  fontWeight: Weightenum.BOLD,
                ),
                hintText: 'Masukkan kode promo',
                maxLines: 1,
              ),
              const SizedBox(height: 4),
              TextNunito(
                text: 'Pastikan kode promo valid dan belum kedaluwarsa',
                size: 12,
                fontWeight: Weightenum.REGULAR,
                color: Resources.color.neutral500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
