import 'package:flutter/material.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:sizer/sizer.dart';

class TermsOfServiceCheckbox extends StatelessWidget {
  const TermsOfServiceCheckbox({
    Key? key,
    this.onChanged,
    this.isAgree = false,
  }) : super(key: key);

  final void Function(bool?)? onChanged;
  final bool isAgree;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: isAgree,
      onChanged: onChanged,
      activeColor: Resources.color.indigo700,
      side: BorderSide(
        color: Resources.color.neutral400,
      ),
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: const EdgeInsets.all(0),
      dense: true,
      visualDensity: VisualDensity.compact,
      isThreeLine: true,
      title: InkWell(
        onTap: () {},
        child: TextNunito(
          text: 'Syarat & Ketentuan',
          color: Resources.color.indigo700,
          size: 10.sp,
          fontWeight: Weightenum.MEDIUM,
        ),
      ),
      subtitle: TextNunito(
        text:
            'Saya setuju dengan syarat dan ketentuan dan sudah membaca kebijakan aplikasi ini',
        maxLines: 3,
        size: 11.sp,
        fontWeight: Weightenum.REGULAR,
      ),
    );
  }
}
