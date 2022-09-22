import 'package:flutter/material.dart';
import 'package:notesgram/presentation/widgets/button/primary_button.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/theme/resources/gen/assets.gen.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:remixicon/remixicon.dart';

class ChallengeTile extends StatelessWidget {
  const ChallengeTile({
    this.onClaimTap,
    this.onTermsAndConditionTap,
    this.challengeIcon,
    this.challengeIconColor,
    required this.totalProgress,
    required this.currentProgress,
    required this.title,
    required this.description,
    required this.duration,
    Key? key,
  }) : super(key: key);

  final Function()? onClaimTap;
  final Function()? onTermsAndConditionTap;
  final String duration;
  final String title;
  final String description;
  final IconData? challengeIcon;
  final Color? challengeIconColor;
  final int totalProgress;
  final int currentProgress;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      elevation: 12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 96,
            padding: const EdgeInsets.only(left: 16),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(6),
              ),
              image: DecorationImage(
                image: AssetImage(
                  Assets.lib.theme.resources.images.challengeTileLayoutBg.path,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 56,
                  height: 56,
                  margin: const EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    color: Resources.color.neutral50,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      challengeIcon,
                      color: challengeIconColor,
                      size: 28,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: TextNunito(
                    text: title,
                    size: 18,
                    maxLines: 2,
                    fontWeight: Weightenum.BOLD,
                    color: Resources.color.neutral50,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          height: 26,
                          margin: const EdgeInsets.only(
                            top: 8,
                            right: 8,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Resources.color.indigo50,
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Remix.time_line,
                                color: Resources.color.indigo700,
                                size: 14,
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: TextNunito(
                                  text: duration,
                                  size: 12,
                                  maxLines: 2,
                                  fontWeight: Weightenum.REGULAR,
                                  color: Resources.color.indigo700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Resources.color.neutral50,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextNunito(
                  text: description,
                  size: 16,
                  fontWeight: Weightenum.BOLD,
                ),
                const SizedBox(height: 4),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextNunito(
                      text: '$currentProgress/$totalProgress',
                      size: 12,
                      fontWeight: Weightenum.REGULAR,
                      color: Resources.color.neutral500,
                    ),
                    LinearProgressIndicator(
                      backgroundColor: Resources.color.indigo10,
                      minHeight: 8,
                      value: currentProgress / totalProgress,
                      color: Resources.color.indigo700,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: onTermsAndConditionTap,
                      child: TextNunito(
                        text: 'Syarat dan ketentuan',
                        size: 14,
                        fontWeight: Weightenum.REGULAR,
                        color: Resources.color.indigo700,
                      ),
                    ),
                    PrimaryButton(
                      elevation: 0,
                      fontSize: 16,
                      onPressed: onClaimTap,
                      label: 'KLAIM',
                      width: 103,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
