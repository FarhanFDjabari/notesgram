import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/presentation/features/auth/controllers/create_username_controller.dart';
import 'package:notesgram/presentation/widgets/outlined_textfield.dart';
import 'package:notesgram/presentation/widgets/button/custom_text_button.dart';
import 'package:notesgram/presentation/widgets/button/primary_button.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/theme/resources/gen/assets.gen.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:notesgram/utils/helpers/validator.dart';
import 'package:remixicon/remixicon.dart';
import 'package:sizer/sizer.dart';

class CreateUsernamePage extends GetView<CreateUsernameController> {
  CreateUsernamePage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 10, 16, 20.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.sp),
                CustomTextButton(
                  onPressed: () {
                    controller.goBack();
                  },
                  label: 'Kembali',
                  labelSize: 14.sp,
                  labelWeight: Weightenum.REGULAR,
                  height: 20.sp,
                  width: 70.sp,
                  isPrefixIcon: true,
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Resources.color.indigo700,
                    size: 14.sp,
                  ),
                ),
                SizedBox(height: 20.sp),
                Container(
                  margin: EdgeInsets.only(bottom: 35.sp),
                  child: Center(
                    child: Assets.lib.theme.resources.images.nameLogo.image(
                      width: 244,
                      height: 48,
                    ),
                  ),
                ),
                TextNunito(
                  text: "Buat username",
                  color: Resources.color.neutral900,
                  size: 20.sp,
                  fontWeight: Weightenum.BOLD,
                ),
                SizedBox(height: 4.sp),
                TextNunito(
                  text:
                      "Buat username untuk akun baru Anda. Kamu dapat mengubahnya nanti",
                  color: Resources.color.neutral900,
                  size: 13.sp,
                  maxLines: 3,
                  fontWeight: Weightenum.REGULAR,
                ),
                const SizedBox(height: 24),
                GetBuilder<CreateUsernameController>(
                  init: CreateUsernameController(),
                  builder: (_) {
                    return OutlinedTextfield(
                      controller: controller.usernameController,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      label: TextNunito(
                        text: 'Username',
                        size: 13.sp,
                        align: TextAlign.start,
                        fontWeight: Weightenum.REGULAR,
                        color: Resources.color.neutral900,
                      ),
                      hintText: 'Masukkan username yang Anda inginkan',
                      onChanged: controller.onUsernameChange,
                      suffixIcon: controller.usernameController.text.isNotEmpty
                          ? controller.isUsernameValid.isTrue
                              ? IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Remix.checkbox_circle_line,
                                    color: Resources.color.statePositive,
                                  ),
                                )
                              : IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Remix.close_circle_line,
                                    color: Resources.color.stateNegative,
                                  ),
                                )
                          : null,
                      validator: Validator().notEmpty,
                    );
                  },
                ),
                SizedBox(height: 24.sp),
                GetX<CreateUsernameController>(
                  init: CreateUsernameController(),
                  builder: (_) {
                    return PrimaryButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate() &&
                            controller.isUsernameValid.isTrue) {
                          controller.createUsername(
                            username: controller.usernameController.text,
                          );
                        }
                      },
                      label: 'DAFTAR',
                      isLoading: controller.isLoading,
                      isEnabled: controller.isUsernameValid.value,
                    );
                  },
                ),
                SizedBox(height: 24.sp),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
