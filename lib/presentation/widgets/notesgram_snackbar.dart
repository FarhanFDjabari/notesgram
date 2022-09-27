import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:notesgram/utils/helpers/snackbar_state_enum.dart';

class NotesgramSnackbar extends GetSnackBar {
  final String? snackbarMessage;
  final String? snackbarTitle;
  final SnackbarStateEnum snackbarStateEnum;

  NotesgramSnackbar({
    this.snackbarMessage,
    this.snackbarTitle,
    this.snackbarStateEnum = SnackbarStateEnum.NORMAL,
    Key? key,
  }) : super(
          key: key,
          duration: const Duration(seconds: 3),
          snackStyle: SnackStyle.FLOATING,
          backgroundColor: snackbarStateEnum == SnackbarStateEnum.ERROR
              ? Resources.color.stateNegative50
              : snackbarStateEnum == SnackbarStateEnum.WARNING
                  ? Resources.color.stateWarning50
                  : snackbarStateEnum == SnackbarStateEnum.POSITIVE
                      ? Resources.color.statePositive50
                      : Resources.color.indigo50,
          borderColor: snackbarStateEnum == SnackbarStateEnum.ERROR
              ? Resources.color.stateNegative
              : snackbarStateEnum == SnackbarStateEnum.WARNING
                  ? Resources.color.stateWarning
                  : snackbarStateEnum == SnackbarStateEnum.POSITIVE
                      ? Resources.color.statePositive
                      : Resources.color.indigo700,
          borderRadius: 6,
          margin: const EdgeInsets.all(16),
          titleText: TextNunito(
            text: snackbarTitle,
            size: 15,
            maxLines: 2,
            fontWeight: Weightenum.REGULAR,
            color: snackbarStateEnum == SnackbarStateEnum.ERROR
                ? Resources.color.stateNegative
                : snackbarStateEnum == SnackbarStateEnum.WARNING
                    ? Resources.color.stateWarning
                    : snackbarStateEnum == SnackbarStateEnum.POSITIVE
                        ? Resources.color.statePositive
                        : Resources.color.indigo700,
          ),
          messageText: TextNunito(
            text: snackbarMessage,
            size: 15,
            maxLines: 2,
            fontWeight: Weightenum.REGULAR,
            color: snackbarStateEnum == SnackbarStateEnum.ERROR
                ? Resources.color.stateNegative
                : snackbarStateEnum == SnackbarStateEnum.WARNING
                    ? Resources.color.stateWarning
                    : snackbarStateEnum == SnackbarStateEnum.POSITIVE
                        ? Resources.color.statePositive
                        : Resources.color.indigo700,
          ),
        );
}
