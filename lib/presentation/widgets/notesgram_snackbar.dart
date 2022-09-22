import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/utils/helpers/constant.dart';

class NotesgramSnackbar extends GetSnackBar {
  final String message;

  NotesgramSnackbar({
    required this.message,
    Key? key,
  }) : super(
          key: key,
          duration: const Duration(seconds: 3),
          snackStyle: SnackStyle.FLOATING,
          backgroundColor: Resources.color.indigo50,
          borderColor: Resources.color.indigo700,
          borderRadius: 6,
          margin: const EdgeInsets.all(16),
          messageText: TextNunito(
            text: message,
            size: 15,
            maxLines: 2,
            fontWeight: Weightenum.REGULAR,
            color: Resources.color.indigo700,
          ),
        );
}
