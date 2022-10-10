import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/presentation/features/home/widget/home_topup_tile.dart';
import 'package:notesgram/presentation/features/payment/controller/payment_controller.dart';
import 'package:notesgram/presentation/features/payment/widget/note_subtotal_info.dart';
import 'package:notesgram/presentation/features/payment/widget/payment_summary_tile.dart';
import 'package:notesgram/presentation/features/payment/widget/payment_total_price_tile.dart';
import 'package:notesgram/presentation/features/payment/widget/promo_code_input.dart';
import 'package:notesgram/presentation/widgets/notesgram_dialog.dart';
import 'package:notesgram/presentation/widgets/state_handle_widget.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:remixicon/remixicon.dart';
import 'package:sizer/sizer.dart';

class PaymentPage extends GetView<PaymentController> {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StateHandleWidget(
      body: Scaffold(
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
                NoteSubtotalInfo(
                  postUser: controller.mData?.user?.name,
                  postUsername: controller.mData?.user?.username,
                  noteTitle: controller.mData?.note?.title,
                  notePrice: '${controller.mData?.note?.price}',
                  userProfileUrl: controller.mData?.user?.avatarUrl,
                  noteImageUrl:
                      controller.mData?.note?.notePictures?.first.pictureUrl,
                ),
                PromoCodeInput(),
                PaymentSummaryTile(
                  price: '${controller.mData?.note?.price}',
                  discountPrice: '0',
                ),
                Card(
                  elevation: 8,
                  shadowColor: Resources.color.shadowColor.withOpacity(0.16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  color: Resources.color.neutral50,
                  margin: const EdgeInsets.fromLTRB(0, 8, 0, 16),
                  child: HomeTopUpTile(
                    coinAmount: controller.coins.value,
                    onTopUpPressed: () {
                      controller.goToTopUp();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: PaymentTotalPriceTile(
          totalPrice: '${controller.mData?.note?.price}',
          onSelectPaymentPressed: () {
            Get.dialog(
              NotesgramDialog(
                title: 'Konfirmasi Pembayaran',
                description:
                    'Apakah Anda yakin ingin melakukan transaksi pembayaran?',
                successButtonLabel: 'BAYAR',
                cancelButtonLabel: 'BATAL',
                onCancelPressed: () {
                  Get.back();
                },
                onSuccessPressed: () {
                  // controller.goToProcessingPayment();
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
