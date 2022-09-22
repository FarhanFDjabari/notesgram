import 'package:flutter/material.dart';
import 'package:notesgram/presentation/widgets/button/custom_text_button.dart';
import 'package:notesgram/presentation/widgets/button/primary_button.dart';
import 'package:notesgram/presentation/widgets/outlined_textfield.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:notesgram/utils/helpers/validator.dart';

class AddAlbumDialog extends StatelessWidget {
  AddAlbumDialog({
    Key? key,
    required this.controller,
    this.onSuccess,
    this.onCancel,
    this.isLoading,
  }) : super(key: key);

  final TextEditingController controller;
  final Function()? onSuccess;
  final Function()? onCancel;
  final bool? isLoading;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: Resources.color.neutral50,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextNunito(
              text: 'Folder baru',
              size: 20,
              fontWeight: Weightenum.BOLD,
            ),
            const SizedBox(height: 8),
            Form(
              key: _formKey,
              child: OutlinedTextfield(
                controller: controller,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.go,
                label: TextNunito(
                  text: 'Beri nama untuk folder baru Anda',
                  size: 14,
                  fontWeight: Weightenum.REGULAR,
                ),
                hintText: 'Nama folder',
                maxLines: 1,
                validator: Validator().notEmpty,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomTextButton(
                  labelSize: 16,
                  labelWeight: Weightenum.BOLD,
                  label: 'BATAL',
                  onPressed: onCancel,
                  width: 105,
                  height: 48,
                ),
                PrimaryButton(
                  elevation: 0,
                  isLoading: isLoading ?? false,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (onSuccess != null) {
                        onSuccess!();
                      }
                    }
                  },
                  label: 'BUAT FOLDER',
                  fontSize: 16,
                  width: 155,
                  height: 48,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
