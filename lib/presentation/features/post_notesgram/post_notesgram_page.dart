import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/presentation/features/post_notesgram/controller/post_notesgram_controller.dart';
import 'package:notesgram/presentation/widgets/button/primary_button.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:remixicon/remixicon.dart';
import 'package:sizer/sizer.dart';

class PostNotesgramPage extends GetView<PostNotesgramController> {
  const PostNotesgramPage({Key? key}) : super(key: key);

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
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            controller.goBack();
          },
          icon: Icon(
            Remix.close_line,
            color: Resources.color.neutral50,
            size: 28,
          ),
        ),
        actions: [
          Container(
            width: 58.sp,
            padding: const EdgeInsets.symmetric(vertical: 11),
            margin: const EdgeInsets.only(right: 16),
            child: GetBuilder<PostNotesgramController>(
              init: PostNotesgramController(),
              initState: (_) {},
              builder: (_) {
                return ElevatedButton(
                  onPressed: controller.isLoading ? null : () {},
                  child: Center(
                    child: controller.isLoading
                        ? SizedBox(
                            width: 15,
                            height: 15,
                            child: CircularProgressIndicator(
                              backgroundColor: Resources.color.indigo50,
                              color: Resources.color.indigo500,
                              strokeWidth: 2,
                            ),
                          )
                        : TextNunito(
                            text: 'POST',
                            size: 14,
                            fontWeight: Weightenum.BOLD,
                            color: Resources.color.indigo700,
                          ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    primary: Resources.color.neutral50,
                    onPrimary: Resources.color.indigo500,
                    elevation: 0,
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: Center(
        child: TextNunito(
            text: 'Post Page', size: 14.sp, fontWeight: Weightenum.MEDIUM),
      ),
    );
  }
}
