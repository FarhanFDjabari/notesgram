import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/presentation/features/post_notesgram/controller/post_notesgram_controller.dart';
import 'package:notesgram/presentation/features/post_notesgram/widget/post_images_collection.dart';
import 'package:notesgram/presentation/widgets/outlined_textfield.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:notesgram/utils/helpers/validator.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            PostImagesCollection(),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: OutlinedTextfield(
                controller: controller.titleController,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                label: TextNunito(
                  text: 'Judul catatan',
                  size: 14,
                  fontWeight: Weightenum.REGULAR,
                  maxLines: 1,
                ),
                hintText: 'Masukkan judul catatan anda',
                maxLines: 1,
                validator: Validator().notEmpty,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: OutlinedTextfield(
                controller: controller.captionController,
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.newline,
                label: TextNunito(
                  text: 'Caption',
                  size: 14,
                  fontWeight: Weightenum.REGULAR,
                ),
                maxLength: 2000,
                hintText: 'Tulis caption',
                validator: Validator().notEmpty,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: OutlinedTextfield(
                controller: controller.priceController,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                label: TextNunito(
                  text: 'Harga',
                  size: 14,
                  fontWeight: Weightenum.REGULAR,
                  maxLines: 1,
                ),
                hintText: 'Harga catatan',
                validator: Validator().notEmpty,
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    // controller.goToResetPassword();
                  },
                  child: TextNunito(
                    text: 'Ketentuan harga',
                    size: 12.sp,
                    fontWeight: Weightenum.BOLD,
                    color: Resources.color.indigo700,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
