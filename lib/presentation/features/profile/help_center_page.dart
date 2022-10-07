import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/presentation/features/profile/controller/help_center_controller.dart';
import 'package:notesgram/presentation/features/profile/widget/help_center_header.dart';
import 'package:notesgram/presentation/widgets/button/primary_button.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/theme/resources/gen/assets.gen.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:remixicon/remixicon.dart';
import 'package:sizer/sizer.dart';

class HelpCenterPage extends GetView<HelpCenterController> {
  const HelpCenterPage({Key? key}) : super(key: key);

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
          text: 'Bantuan',
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
      body: SizedBox(
        width: SizerUtil.width,
        height: SizerUtil.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              HelpCenterHeader(),
              Card(
                elevation: 8,
                shadowColor: Resources.color.shadowColor.withOpacity(0.16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                color: Resources.color.neutral50,
                margin: const EdgeInsets.all(16.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextNunito(
                        text: 'Paling Sering Ditanyakan',
                        size: 18,
                        fontWeight: Weightenum.BOLD,
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (builderContext, index) {
                          return ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 12,
                            ),
                            onTap: () {},
                            title: TextNunito(
                              text: 'Bagaimana cara mendapatkan kode promo?',
                              maxLines: 4,
                              size: 16,
                              fontWeight: Weightenum.REGULAR,
                            ),
                            trailing: Icon(
                              Remix.arrow_right_s_line,
                              color: Resources.color.indigo700,
                            ),
                          );
                        },
                        separatorBuilder: (_, index) {
                          return Container(
                            height: 1,
                            color: Resources.color.neutral200,
                          );
                        },
                        itemCount: 5,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 158,
                margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                padding: const EdgeInsets.fromLTRB(0, 16, 16, 16),
                decoration: BoxDecoration(
                  color: Resources.color.indigo50,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Assets.lib.theme.resources.images.helpCenterFooterImage
                        .image(width: 120.sp),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextNunito(
                            text: 'Masih butuh bantuan?',
                            size: 13.sp,
                            fontWeight: Weightenum.BOLD,
                          ),
                          const SizedBox(height: 4),
                          TextNunito(
                            text: 'Kami selalu ada untuk membantu Anda',
                            size: 9.sp,
                            maxLines: 4,
                            fontWeight: Weightenum.REGULAR,
                          ),
                          const SizedBox(height: 12),
                          PrimaryButton(
                            onPressed: () {},
                            width: SizerUtil.width,
                            height: 48,
                            fontSize: 16,
                            elevation: 0,
                            label: 'HUBUNGI KAMI',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
