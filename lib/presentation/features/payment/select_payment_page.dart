import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/presentation/features/payment/controller/payment_controller.dart';
import 'package:notesgram/presentation/features/payment/widget/payment_method_tile.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:remixicon/remixicon.dart';
import 'package:sizer/sizer.dart';

class SelectPaymentPage extends GetView<PaymentController> {
  const SelectPaymentPage({Key? key}) : super(key: key);

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
              TextNunito(
                text: 'Pilih Metode Pembayaran',
                size: 20,
                fontWeight: Weightenum.BOLD,
              ),
              const SizedBox(height: 24),
              TextNunito(
                text: 'Dompet digital',
                size: 20,
                fontWeight: Weightenum.BOLD,
                color: Resources.color.neutral500,
              ),
              const SizedBox(height: 8),
              Card(
                elevation: 8,
                shadowColor: Resources.color.shadowColor.withOpacity(0.16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                color: Resources.color.neutral50,
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      PaymentMethodTile(
                        onTap: () {
                          controller.goToProcessingPayment();
                        },
                        border: Border(
                          bottom: BorderSide(
                            width: 1,
                            color: Resources.color.neutral300,
                          ),
                        ),
                      ),
                      PaymentMethodTile(
                        onTap: () {},
                        border: Border(
                          bottom: BorderSide(
                            width: 1,
                            color: Resources.color.neutral300,
                          ),
                        ),
                      ),
                      PaymentMethodTile(
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              TextNunito(
                text: 'Bank digital',
                size: 20,
                fontWeight: Weightenum.BOLD,
                color: Resources.color.neutral500,
              ),
              const SizedBox(height: 8),
              Card(
                elevation: 8,
                shadowColor: Resources.color.shadowColor.withOpacity(0.16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                color: Resources.color.neutral50,
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      PaymentMethodTile(
                        onTap: () {},
                        border: Border(
                          bottom: BorderSide(
                            width: 1,
                            color: Resources.color.neutral300,
                          ),
                        ),
                      ),
                      PaymentMethodTile(
                        onTap: () {},
                        border: Border(
                          bottom: BorderSide(
                            width: 1,
                            color: Resources.color.neutral300,
                          ),
                        ),
                      ),
                      PaymentMethodTile(
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
