import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/presentation/features/profile/controller/profile_controller.dart';
import 'package:notesgram/presentation/features/profile/widget/profile_drawer_tile.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:notesgram/utils/helpers/currency_formatter.dart';
import 'package:notesgram/utils/routes/page_name.dart';
import 'package:remixicon/remixicon.dart';
import 'package:sizer/sizer.dart';

class ProfileDrawer extends GetView<ProfileController> {
  const ProfileDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Resources.color.neutral50,
      width: 185.sp,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Resources.color.indigo50,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      backgroundColor: Resources.color.indigo100,
                      radius: 30,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextNunito(
                            text: controller.mData?.name,
                            size: 14,
                            fontWeight: Weightenum.BOLD,
                          ),
                          TextNunito(
                            text: '@${controller.mData?.username}',
                            size: 12,
                            fontWeight: Weightenum.REGULAR,
                            color: Resources.color.neutral500,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Remix.coins_fill,
                                size: 14,
                                color: Resources.color.stateWarning,
                              ),
                              const SizedBox(width: 6),
                              Expanded(
                                child: TextNunito(
                                  text: int.parse(controller.mData?.username ??
                                              '0') >
                                          999
                                      ? coinFormat.format(int.parse(
                                          controller.mData?.username ?? '0'))
                                      : controller.mData?.username ?? '0',
                                  size: 14,
                                  fontWeight: Weightenum.BOLD,
                                  color: Resources.color.stateWarning,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              ProfileDrawerTile(
                onTileTap: () {
                  Get.toNamed(PageName.transactionHistory);
                },
                iconColor: Resources.color.indigo700,
                iconData: Remix.file_list_3_line,
                label: 'Riwayat Transaksi',
                labelColor: Resources.color.indigo700,
              ),
              const SizedBox(height: 8),
              ProfileDrawerTile(
                onTileTap: () {
                  Get.toNamed(PageName.help);
                },
                iconColor: Resources.color.indigo700,
                iconData: Remix.customer_service_2_line,
                label: 'Bantuan',
                labelColor: Resources.color.indigo700,
              ),
              const Spacer(),
              ProfileDrawerTile(
                onTileTap: () {},
                iconColor: Resources.color.stateNegative,
                iconData: Remix.logout_box_line,
                label: 'Keluar',
                labelColor: Resources.color.stateNegative,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
