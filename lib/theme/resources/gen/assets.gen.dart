/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $LibGen {
  const $LibGen();

  $LibThemeGen get theme => const $LibThemeGen();
}

class $LibThemeGen {
  const $LibThemeGen();

  $LibThemeResourcesGen get resources => const $LibThemeResourcesGen();
}

class $LibThemeResourcesGen {
  const $LibThemeResourcesGen();

  $LibThemeResourcesAnimationsGen get animations =>
      const $LibThemeResourcesAnimationsGen();
  $LibThemeResourcesImagesGen get images => const $LibThemeResourcesImagesGen();
}

class $LibThemeResourcesAnimationsGen {
  const $LibThemeResourcesAnimationsGen();

  /// File path: lib/theme/resources/animations/custom_loading.json
  String get customLoading =>
      'lib/theme/resources/animations/custom_loading.json';
}

class $LibThemeResourcesImagesGen {
  const $LibThemeResourcesImagesGen();

  /// File path: lib/theme/resources/images/app_logo.png
  AssetGenImage get appLogo =>
      const AssetGenImage('lib/theme/resources/images/app_logo.png');

  /// File path: lib/theme/resources/images/app_logo_4x.png
  AssetGenImage get appLogo4x =>
      const AssetGenImage('lib/theme/resources/images/app_logo_4x.png');

  /// File path: lib/theme/resources/images/app_logo_monochrome.png
  AssetGenImage get appLogoMonochrome =>
      const AssetGenImage('lib/theme/resources/images/app_logo_monochrome.png');

  /// File path: lib/theme/resources/images/challenge_floating_button.png
  AssetGenImage get challengeFloatingButton => const AssetGenImage(
      'lib/theme/resources/images/challenge_floating_button.png');

  /// File path: lib/theme/resources/images/challenge_tile_layout_bg.png
  AssetGenImage get challengeTileLayoutBg => const AssetGenImage(
      'lib/theme/resources/images/challenge_tile_layout_bg.png');

  /// File path: lib/theme/resources/images/correct_green.svg
  SvgGenImage get correctGreen =>
      const SvgGenImage('lib/theme/resources/images/correct_green.svg');

  /// File path: lib/theme/resources/images/error_red.svg
  SvgGenImage get errorRed =>
      const SvgGenImage('lib/theme/resources/images/error_red.svg');

  /// File path: lib/theme/resources/images/explore.svg
  SvgGenImage get explore =>
      const SvgGenImage('lib/theme/resources/images/explore.svg');

  /// File path: lib/theme/resources/images/explore_active.svg
  SvgGenImage get exploreActive =>
      const SvgGenImage('lib/theme/resources/images/explore_active.svg');

  /// File path: lib/theme/resources/images/help_center_footer_image.png
  AssetGenImage get helpCenterFooterImage => const AssetGenImage(
      'lib/theme/resources/images/help_center_footer_image.png');

  /// File path: lib/theme/resources/images/help_center_header_bg_layout.png
  AssetGenImage get helpCenterHeaderBgLayout => const AssetGenImage(
      'lib/theme/resources/images/help_center_header_bg_layout.png');

  /// File path: lib/theme/resources/images/home.svg
  SvgGenImage get home =>
      const SvgGenImage('lib/theme/resources/images/home.svg');

  /// File path: lib/theme/resources/images/home_active.svg
  SvgGenImage get homeActive =>
      const SvgGenImage('lib/theme/resources/images/home_active.svg');

  /// File path: lib/theme/resources/images/icons_google.svg
  SvgGenImage get iconsGoogle =>
      const SvgGenImage('lib/theme/resources/images/icons_google.svg');

  /// File path: lib/theme/resources/images/launcher_icon.png
  AssetGenImage get launcherIcon =>
      const AssetGenImage('lib/theme/resources/images/launcher_icon.png');

  /// File path: lib/theme/resources/images/name_logo.png
  AssetGenImage get nameLogo =>
      const AssetGenImage('lib/theme/resources/images/name_logo.png');

  /// File path: lib/theme/resources/images/notification.svg
  SvgGenImage get notification =>
      const SvgGenImage('lib/theme/resources/images/notification.svg');

  /// File path: lib/theme/resources/images/notification_active.svg
  SvgGenImage get notificationActive =>
      const SvgGenImage('lib/theme/resources/images/notification_active.svg');

  /// File path: lib/theme/resources/images/obscure_close.svg
  SvgGenImage get obscureClose =>
      const SvgGenImage('lib/theme/resources/images/obscure_close.svg');

  /// File path: lib/theme/resources/images/obscure_open.svg
  SvgGenImage get obscureOpen =>
      const SvgGenImage('lib/theme/resources/images/obscure_open.svg');

  /// File path: lib/theme/resources/images/post.svg
  SvgGenImage get post =>
      const SvgGenImage('lib/theme/resources/images/post.svg');

  /// File path: lib/theme/resources/images/post_active.svg
  SvgGenImage get postActive =>
      const SvgGenImage('lib/theme/resources/images/post_active.svg');

  /// File path: lib/theme/resources/images/profile.svg
  SvgGenImage get profile =>
      const SvgGenImage('lib/theme/resources/images/profile.svg');

  /// File path: lib/theme/resources/images/profile_active.svg
  SvgGenImage get profileActive =>
      const SvgGenImage('lib/theme/resources/images/profile_active.svg');

  /// File path: lib/theme/resources/images/profile_coin_layout_bg.png
  AssetGenImage get profileCoinLayoutBg => const AssetGenImage(
      'lib/theme/resources/images/profile_coin_layout_bg.png');
}

class Assets {
  Assets._();

  static const $LibGen lib = $LibGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
    bool cacheColorFilter = false,
    SvgTheme? theme,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
      theme: theme,
    );
  }

  String get path => _assetName;
}
