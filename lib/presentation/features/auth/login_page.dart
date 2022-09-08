import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/presentation/features/auth/controllers/login_controller.dart';
import 'package:notesgram/presentation/widgets/outlined_textfield.dart';
import 'package:notesgram/presentation/widgets/button/custom_outline_button.dart';
import 'package:notesgram/presentation/widgets/button/primary_button.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/theme/resources/gen/assets.gen.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:notesgram/utils/helpers/validator.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends GetView<LoginController> {
  LoginPage({Key? key}) : super(key: key);
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
                Container(
                  margin: EdgeInsets.symmetric(vertical: 35.sp),
                  child: Center(
                    child: Assets.lib.theme.resources.images.nameLogo.image(
                      width: 244,
                      height: 48,
                    ),
                  ),
                ),
                TextNunito(
                  text: "Selamat datang!",
                  color: Resources.color.neutral900,
                  size: 20.sp,
                  fontWeight: Weightenum.BOLD,
                ),
                SizedBox(height: 4.sp),
                TextNunito(
                  text: "Masuk ke akun Anda untuk melanjutkan",
                  color: Resources.color.neutral900,
                  size: 13.sp,
                  fontWeight: Weightenum.REGULAR,
                ),
                const SizedBox(height: 24),
                CustomOutlineButton(
                  onPressed: () {},
                  icon: Assets.lib.theme.resources.images.iconsGoogle
                      .svg(height: 20.sp),
                  isPrefixIcon: true,
                  label: 'Masuk dengan Google',
                ),
                Container(
                  height: 21.sp,
                  margin: const EdgeInsets.symmetric(vertical: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          color: Resources.color.neutral400,
                          height: 1.sp,
                          margin: EdgeInsets.only(right: 10.sp),
                        ),
                      ),
                      TextNunito(
                        text: 'atau',
                        size: 13.sp,
                        fontWeight: Weightenum.REGULAR,
                        color: Resources.color.neutral400,
                      ),
                      Expanded(
                        child: Container(
                          color: Resources.color.neutral400,
                          height: 1.sp,
                          margin: EdgeInsets.only(left: 10.sp),
                        ),
                      ),
                    ],
                  ),
                ),
                GetBuilder<LoginController>(
                  init: LoginController(),
                  builder: (emailTextFieldController) {
                    return OutlinedTextfield(
                      controller: controller.usernameController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      label: TextNunito(
                        text: 'Username, atau email',
                        size: 13.sp,
                        align: TextAlign.start,
                        fontWeight: Weightenum.REGULAR,
                        color: Resources.color.neutral900,
                      ),
                      hintText: 'Masukkan username, atau email Anda',
                      validator: Validator().notEmpty,
                    );
                  },
                ),
                SizedBox(height: 13.sp),
                Obx(() => OutlinedTextfield(
                      controller: controller.passwordController,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      maxLines: 1,
                      label: TextNunito(
                        text: 'Password',
                        size: 13.sp,
                        align: TextAlign.start,
                        fontWeight: Weightenum.REGULAR,
                        color: Resources.color.neutral900,
                      ),
                      hintText: 'Masukkan password Anda',
                      isObscured: controller.isPasswordObscured.value,
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.isPasswordObscured(
                            !controller.isPasswordObscured.value,
                          );
                        },
                        icon: controller.isPasswordObscured.isTrue
                            ? Assets.lib.theme.resources.images.obscureClose
                                .svg()
                            : Assets.lib.theme.resources.images.obscureOpen
                                .svg(),
                      ),
                      validator: Validator().notEmpty,
                    )),
                SizedBox(height: 4.sp),
                InkWell(
                  onTap: () {
                    // controller.goToResetPassword();
                  },
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: TextNunito(
                      text: 'Lupa password?',
                      size: 12.sp,
                      fontWeight: Weightenum.BOLD,
                      color: Resources.color.indigo700,
                    ),
                  ),
                ),
                SizedBox(height: 24.sp),
                PrimaryButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      controller.goToHome();
                    }
                  },
                  label: 'MASUK',
                  isLoading: controller.isLoading,
                ),
                SizedBox(height: 24.sp),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextNunito(
                      text: 'Belum punya akun?',
                      size: 13.sp,
                      fontWeight: Weightenum.REGULAR,
                      color: Resources.color.neutral600,
                    ),
                    SizedBox(width: 4.sp),
                    InkWell(
                      onTap: () {
                        controller.goToRegister();
                      },
                      child: TextNunito(
                        text: 'Daftar',
                        size: 13.sp,
                        fontWeight: Weightenum.BOLD,
                        color: Resources.color.indigo700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
