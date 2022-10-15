import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/presentation/features/auth/controllers/register_controller.dart';
import 'package:notesgram/presentation/widgets/outlined_textfield.dart';
import 'package:notesgram/presentation/features/auth/widgets/terms_of_services_checkbox.dart';
import 'package:notesgram/presentation/widgets/button/custom_outline_button.dart';
import 'package:notesgram/presentation/widgets/button/primary_button.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/theme/resources/gen/assets.gen.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:notesgram/utils/helpers/validator.dart';
import 'package:sizer/sizer.dart';

class RegisterPage extends GetView<RegisterController> {
  RegisterPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                    text: "Buat akun baru",
                    color: Resources.color.neutral900,
                    size: 20.sp,
                    fontWeight: Weightenum.BOLD,
                  ),
                  SizedBox(height: 4.sp),
                  TextNunito(
                    text: "Isi data-data di bawah ini dengan benar",
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
                    label: 'Daftar dengan Google',
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
                  GetBuilder<RegisterController>(
                    init: RegisterController(),
                    builder: (_) {
                      return OutlinedTextfield(
                        controller: controller.nameController,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        label: TextNunito(
                          text: 'Nama',
                          size: 13.sp,
                          align: TextAlign.start,
                          fontWeight: Weightenum.REGULAR,
                          color: Resources.color.neutral900,
                        ),
                        hintText: 'Masukkan nama Anda',
                        validator: Validator().notEmpty,
                        onChanged: (_) {
                          controller.update();
                        },
                      );
                    },
                  ),
                  SizedBox(height: 13.sp),
                  OutlinedTextfield(
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    label: TextNunito(
                      text: 'Email',
                      size: 13.sp,
                      align: TextAlign.start,
                      fontWeight: Weightenum.REGULAR,
                      color: Resources.color.neutral900,
                    ),
                    onChanged: (_) {
                      controller.update();
                    },
                    hintText: 'Masukkan email Anda',
                    validator: Validator().email,
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
                        onChanged: (_) {
                          controller.update();
                        },
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
                  // terms and requirement checkbox
                  Obx(
                    () => TermsOfServiceCheckbox(
                      isAgree: controller.isUserAgree.isTrue,
                      onAppPolicyTap: (_) {
                        // controller.isReadPolicy(true);
                        // controller.isUserAgree(controller.isReadPolicy.isTrue &&
                        //     controller.isReadTerms.isTrue);
                        // controller.update();
                      },
                      onTermsAndConditionTap: (_) {
                        // controller.isReadTerms(true);
                        // controller.isUserAgree(controller.isReadPolicy.isTrue &&
                        //     controller.isReadTerms.isTrue);
                        // controller.update();
                      },
                      onChanged: (value) {
                        controller.isReadTerms(value);
                        controller.isReadPolicy(true);
                        controller.isUserAgree(controller.isReadPolicy.isTrue &&
                            controller.isReadTerms.isTrue);
                        controller.update();
                      },
                    ),
                  ),
                  SizedBox(height: 24.sp),
                  GetBuilder<RegisterController>(
                    builder: (_) {
                      return PrimaryButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            controller.register(
                              name: controller.nameController.text,
                              email: controller.emailController.text,
                              password: controller.passwordController.text,
                            );
                          }
                        },
                        label: 'LANJUT',
                        isLoading: controller.isLoading,
                        isEnabled: controller.isUserAgree.isTrue,
                      );
                    },
                  ),
                  SizedBox(height: 24.sp),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextNunito(
                        text: 'Sudah punya akun?',
                        size: 13.sp,
                        fontWeight: Weightenum.REGULAR,
                        color: Resources.color.neutral600,
                      ),
                      SizedBox(width: 4.sp),
                      InkWell(
                        onTap: () {
                          controller.goToLogin();
                        },
                        child: TextNunito(
                          text: 'Masuk',
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
      ),
    );
  }
}
