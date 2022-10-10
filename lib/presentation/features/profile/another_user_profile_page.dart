import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/presentation/features/profile/controller/another_user_profile_controller.dart';
import 'package:notesgram/presentation/features/profile/widget/another_user_post_fragment.dart';
import 'package:notesgram/presentation/features/profile/widget/profile_header.dart';
import 'package:notesgram/presentation/widgets/loading_overlay.dart';
import 'package:notesgram/presentation/widgets/state_handle_widget.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:remixicon/remixicon.dart';
import 'package:sizer/sizer.dart';

class AnotherUserProfilePage extends StatefulWidget {
  const AnotherUserProfilePage({Key? key}) : super(key: key);

  @override
  State<AnotherUserProfilePage> createState() => _AnotherUserProfilePageState();
}

class _AnotherUserProfilePageState extends State<AnotherUserProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 1, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AnotherUserProfileController>(
      initState: (state) {},
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: Resources.color.gradient600to800,
              ),
            ),
            elevation: 0,
            centerTitle: true,
            automaticallyImplyLeading: true,
            foregroundColor: Resources.color.neutral50,
            title: TextNunito(
              text: controller.mData?.userModel?.username,
              size: 15.sp,
              fontWeight: Weightenum.BOLD,
              color: Resources.color.neutral50,
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StateHandleWidget(
                  shimmerView: LoadingOverlay(),
                  loadingEnabled: controller.isLoading,
                  body: ProfileHeader(
                    onFollowTap: () {},
                    isCurrentUser: false,
                    isUserFollowed: controller.mData?.isFollowed,
                    name: controller.mData?.userModel?.name,
                    postCount: '${controller.mData?.userModel?.cCount?.posts}',
                    followersCount:
                        '${controller.mData?.userModel?.cCount?.followers}',
                    followingCount:
                        '${controller.mData?.userModel?.cCount?.followings}',
                    coins: controller.mData?.userModel?.coins,
                    avatarUrl: controller.mData?.userModel?.avatarUrl,
                  ),
                ),
                TabBar(
                  controller: _tabController,
                  tabs: const [
                    Tab(
                      key: ValueKey('my_post'),
                      icon: Icon(
                        Remix.grid_line,
                      ),
                    ),
                  ],
                  labelColor: Resources.color.indigo900,
                  unselectedLabelColor: Resources.color.neutral400,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: Resources.color.indigo900,
                  indicatorWeight: 2,
                ),
                SizedBox(
                  height: SizerUtil.height * 0.5,
                  child: TabBarView(
                    controller: _tabController,
                    children: const [
                      AnotherUserPostFragment(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
