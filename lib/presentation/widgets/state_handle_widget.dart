import 'package:flutter/material.dart';
import 'package:notesgram/presentation/widgets/shimmers/list_view_shimmer.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/theme/resources/gen/assets.gen.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class StateHandleWidget extends StatefulWidget {
  final bool typeList;
  final bool visibleOnEmpty;
  final bool visibleOnError;
  final bool emptyEnabled;
  final bool loadingEnabled;
  final bool errorEnabled;
  final bool loadingCoverBody;
  final Widget body;
  final Widget? shimmerView;
  final String? errorText;
  final String? emptyTitle;
  final String? emptySubtitle;
  final bool showShimmer;
  final ImageProvider? emptyImage;
  final void Function()? onRetryPressed;

  const StateHandleWidget({
    Key? key,
    required this.body,
    this.emptyImage,
    this.emptyTitle,
    this.emptySubtitle,
    this.errorText,
    this.onRetryPressed,
    this.shimmerView,
    this.showShimmer = false,
    this.emptyEnabled = false,
    this.loadingEnabled = false,
    this.errorEnabled = false,
    this.loadingCoverBody = true,
    this.visibleOnEmpty = true,
    this.visibleOnError = true,
    this.typeList = true,
  }) : super(key: key);

  @override
  _StateHandleWidgetState createState() => _StateHandleWidgetState();
}

class _StateHandleWidgetState extends State<StateHandleWidget> {
  @override
  Widget build(BuildContext context) {
    var loadingWidget =
        widget.shimmerView ?? const IgnorePointer(child: ListViewShimmer());

    return Stack(
      children: [
        AnimatedOpacity(
          opacity: widget.loadingEnabled ||
                  ((widget.emptyEnabled ||
                          (widget.errorEnabled && widget.emptyEnabled)) &&
                      !widget.typeList)
              ? 0.0
              : 1.0,
          duration: Duration(
              milliseconds: widget.loadingEnabled
                  ? 200
                  : widget.errorEnabled || widget.emptyEnabled
                      ? 200
                      : 1000),
          child: getBodyWidget(),
        ),
        getErrorView(),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: getEmptyView()),
        getLoadingView(loadingWidget),
      ],
    );
  }

  Widget getBodyWidget() => ((widget.emptyEnabled && !widget.visibleOnEmpty) ||
          (widget.errorEnabled && !widget.visibleOnError))
      ? Container()
      : widget.body;

  Widget getLoadingView(Widget loadingWidget) => widget.loadingEnabled
      ? Center(
          child: AnimatedOpacity(
              opacity: widget.loadingEnabled ? 1.0 : 0.0,
              duration:
                  Duration(milliseconds: widget.loadingEnabled ? 500 : 500),
              child: loadingWidget),
        )
      : Container();

  bool get isList => widget.typeList ? widget.emptyEnabled : true;

  Widget getErrorView() =>
      widget.visibleOnError && widget.errorEnabled && isList
          ? buildError(widget.errorText, context)
          : Container();

  Widget getEmptyView() => widget.visibleOnEmpty &&
          widget.emptyEnabled &&
          !widget.errorEnabled &&
          !widget.loadingEnabled
      ? buildEmpty(context)
      : Container();

  Widget buildEmpty(BuildContext context) => Center(
        child: SingleChildScrollView(
          primary: false,
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: Image(
                  image: widget.emptyImage ??
                      AssetImage(
                        Assets.lib.theme.resources.images.appLogo.path,
                      ),
                  fit: BoxFit.fitHeight,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              TextNunito(
                size: 16,
                fontWeight: Weightenum.SEMIBOLD,
                text: widget.emptyTitle,
                maxLines: 2,
                align: TextAlign.center,
                color: Resources.color.neutral800,
              ),
              const SizedBox(
                height: 12,
              ),
              TextNunito(
                size: 14,
                fontWeight: Weightenum.REGULAR,
                text: widget.emptySubtitle,
                maxLines: 5,
                align: TextAlign.center,
                color: Resources.color.neutral700,
              ),
            ],
          ),
        ),
      );

  Widget buildError(String? error, BuildContext context) => Center(
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            color: Resources.color.neutral50,
          ),
          child: SingleChildScrollView(
            primary: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 40.sp),
                Container(
                  alignment: Alignment.center,
                  child: Image(
                    image: AssetImage(
                      Assets.lib.theme.resources.images.appLogo.path,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 24.sp,
                ),
                Container(
                  alignment: Alignment.center,
                  child: error != null
                      ? Text(
                          error.isEmpty ? 'txt_error_general'.tr : error,
                          style:
                              Theme.of(context).textTheme.bodyText2?.copyWith(
                                    color: Resources.color.neutral900,
                                  ),
                          textAlign: TextAlign.center,
                        )
                      : Container(),
                ),
                // if (widget.onRetryPressed != null)
                //   SizedBox(
                //     height: 24.sp,
                //   ),
                // if (widget.onRetryPressed != null)
                //   PrimaryButton(
                //     child: Text(
                //       'txt_button_retry'.tr,
                //       style: Theme.of(context)
                //           .textTheme
                //           .button
                //           ?.copyWith(fontSize: 12.sp),
                //     ),
                //     marginHorizontal:
                //         (MediaQuery.of(context).size.width / 5).sp,
                //     height: 28.sp,
                //     onPressed: widget.onRetryPressed,
                //   ),
              ],
            ),
          ),
        ),
      );
}
