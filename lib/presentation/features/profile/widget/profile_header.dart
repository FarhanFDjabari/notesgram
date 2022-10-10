import 'package:flutter/material.dart';
import 'package:notesgram/presentation/features/profile/widget/profile_coin_tile.dart';
import 'package:notesgram/presentation/widgets/button/primary_button.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:sizer/sizer.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    this.onEditProfile,
    this.onAvatarTap,
    this.onTopUp,
    this.onWithdraw,
    this.name,
    this.avatarUrl,
    this.postCount,
    this.followersCount,
    this.followingCount,
    this.coins,
    this.isCurrentUser,
    this.onFollowTap,
    this.isUserFollowed,
    Key? key,
  }) : super(key: key);

  final Function()? onEditProfile;
  final Function()? onTopUp;
  final Function()? onWithdraw;
  final Function()? onAvatarTap;
  final Function()? onFollowTap;
  final bool? isCurrentUser;
  final bool? isUserFollowed;
  final String? name;
  final String? avatarUrl;
  final String? postCount;
  final String? followersCount;
  final String? followingCount;
  final int? coins;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizerUtil.height * (isCurrentUser == true ? 0.45 : 0.3),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: onAvatarTap,
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Resources.color.indigo500,
                  backgroundImage: NetworkImage(
                    '$avatarUrl',
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextNunito(
                            text: name,
                            size: 18,
                            fontWeight: Weightenum.BOLD,
                          ),
                        ),
                        if (isCurrentUser == true) const SizedBox(width: 8),
                        if (isCurrentUser == true)
                          InkWell(
                            onTap: onEditProfile,
                            child: TextNunito(
                              text: 'Edit Profile',
                              size: 14,
                              fontWeight: Weightenum.REGULAR,
                              color: Resources.color.indigo700,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextNunito(
                              text: postCount,
                              size: 16,
                              fontWeight: Weightenum.BOLD,
                            ),
                            TextNunito(
                              text: 'Catatan',
                              size: 12,
                              fontWeight: Weightenum.REGULAR,
                              color: Resources.color.neutral600,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextNunito(
                              text: followersCount,
                              size: 16,
                              fontWeight: Weightenum.BOLD,
                            ),
                            TextNunito(
                              text: 'Pengikut',
                              size: 12,
                              fontWeight: Weightenum.REGULAR,
                              color: Resources.color.neutral600,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextNunito(
                              text: followingCount,
                              size: 16,
                              fontWeight: Weightenum.BOLD,
                            ),
                            TextNunito(
                              text: 'Mengikuti',
                              size: 12,
                              fontWeight: Weightenum.REGULAR,
                              color: Resources.color.neutral600,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          if (isCurrentUser == true)
            ProfileCoinTile(
              onTopUp: onTopUp,
              onWithdraw: onWithdraw,
              coins: coins.toString(),
            ),
          if (isCurrentUser == false)
            PrimaryButton(
              elevation: 0,
              label: isUserFollowed == true ? 'FOLLOWED' : 'FOLLOW',
              onPressed: onFollowTap,
              primaryColor:
                  isUserFollowed == true ? Resources.color.neutral300 : null,
            ),
        ],
      ),
    );
  }
}
