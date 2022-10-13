import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesgram/data/model/user/user_model.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:sizer/sizer.dart';

class CommentTextField extends StatefulWidget {
  const CommentTextField({
    this.onSendPressed,
    this.userAvatar,
    Key? key,
  }) : super(key: key);

  final Function(String)? onSendPressed;
  final String? userAvatar;

  @override
  State<CommentTextField> createState() => _CommentTextFieldState();
}

class _CommentTextFieldState extends State<CommentTextField> {
  final _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      height: 58.sp,
      color: Resources.color.neutral50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Resources.color.indigo400,
            radius: 18,
            backgroundImage: NetworkImage(widget.userAvatar ?? ''),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: SizedBox(
              child: TextFormField(
                controller: _commentController,
                autocorrect: true,
                autofocus: false,
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.newline,
                minLines: 1,
                maxLines: 100,
                maxLength: 2000,
                onChanged: (_) {
                  setState(() {});
                },
                style: GoogleFonts.nunitoSans(
                  fontWeight: FontWeight.w400,
                  fontSize: 13.sp,
                  color: Resources.color.neutral900,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(80),
                    borderSide: BorderSide(
                        color: Resources.color.neutral400, width: 1.5),
                  ),
                  contentPadding: const EdgeInsets.fromLTRB(20, 8, 16, 8),
                  hintText: 'Tulis komen Anda...',
                  hintStyle: GoogleFonts.nunitoSans(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: Resources.color.neutral400,
                  ),
                  filled: true,
                  fillColor: Resources.color.neutral50,
                  counterText: "",
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          if (_commentController.text.isEmpty == false)
            InkWell(
              onTap: () {
                if (widget.onSendPressed != null) {
                  widget.onSendPressed!(_commentController.text);
                }
              },
              child: TextNunito(
                text: 'Kirim',
                size: 15,
                fontWeight: Weightenum.BOLD,
                color: Resources.color.indigo700,
              ),
            ),
        ],
      ),
    );
  }
}
