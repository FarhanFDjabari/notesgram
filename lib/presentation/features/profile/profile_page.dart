import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/presentation/features/profile/controller/profile_controller.dart';
import 'package:notesgram/presentation/features/profile/widget/profile_bookmark_post_fragment.dart';
import 'package:notesgram/presentation/features/profile/widget/profile_header.dart';
import 'package:notesgram/presentation/features/profile/widget/profile_post_fragment.dart';
import 'package:notesgram/presentation/features/profile/widget/profile_purchased_post_fragment.dart';
import 'package:notesgram/presentation/widgets/loading_overlay.dart';
import 'package:notesgram/presentation/widgets/state_handle_widget.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:remixicon/remixicon.dart';
import 'package:sizer/sizer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      initState: (state) {
        state.controller?.getProfile();
      },
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
            automaticallyImplyLeading: false,
            title: TextNunito(
              text: controller.mData?.username,
              size: 15.sp,
              fontWeight: Weightenum.BOLD,
              color: Resources.color.neutral50,
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                icon: Icon(
                  Remix.menu_line,
                  color: Resources.color.neutral50,
                ),
                iconSize: 20,
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StateHandleWidget(
                  shimmerView: LoadingOverlay(),
                  loadingEnabled: controller.isLoading,
                  body: ProfileHeader(
                    onEditProfile: () {},
                    onTopUp: () {
                      controller.goToTopUp();
                    },
                    onWithdraw: () {
                      controller.goToWithdraw();
                    },
                    name: controller.mData?.name,
                    postCount: '${controller.mData?.cCount?.posts}',
                    followersCount: '${controller.mData?.cCount?.followers}',
                    followingCount: '${controller.mData?.cCount?.followings}',
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
                    Tab(
                      key: ValueKey('purchased_post'),
                      icon: Icon(
                        Remix.lock_line,
                      ),
                    ),
                    Tab(
                      key: ValueKey('bookmarked_post'),
                      icon: Icon(
                        Remix.bookmark_line,
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
                    children: [
                      ProfilePostFragment(),
                      ProfilePurchasedPostFragment(),
                      ProfileBookmarkPostFragment(),
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
