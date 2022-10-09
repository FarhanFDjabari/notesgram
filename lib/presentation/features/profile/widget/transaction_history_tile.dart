import 'package:flutter/material.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:notesgram/utils/helpers/currency_formatter.dart';
import 'package:remixicon/remixicon.dart';

class TransactionHistoryTile extends StatelessWidget {
  const TransactionHistoryTile({
    Key? key,
    this.claimedPrize,
    this.icon,
    this.subtitle,
    this.title,
    this.category,
  }) : super(key: key);

  final IconData? icon;
  final String? title;
  final String? subtitle;
  final String? claimedPrize;
  final String? category;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shadowColor: Resources.color.shadowColor.withOpacity(0.16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      color: Resources.color.neutral50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Resources.color.indigo50,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Icon(
                      icon,
                      color: Resources.color.indigo700,
                      size: 30,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextNunito(
                    text: title,
                    maxLines: 2,
                    size: 16,
                    fontWeight: Weightenum.BOLD,
                  ),
                )
              ],
            ),
          ),
          Divider(
            thickness: 1,
            height: 1,
            color: Resources.color.neutral300,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: TextNunito(
                    text: subtitle,
                    size: 14,
                    fontWeight: Weightenum.REGULAR,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Remix.coins_fill,
                      color: Resources.color.stateWarning,
                    ),
                    const SizedBox(width: 6),
                    TextNunito(
                      text: int.parse('$claimedPrize') > 999
                          ? coinFormat.format(int.parse('$claimedPrize'))
                          : '$claimedPrize',
                      size: 20,
                      fontWeight: Weightenum.BOLD,
                      color: Resources.color.stateWarning,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
