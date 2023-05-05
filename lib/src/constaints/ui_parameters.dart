import 'package:flutter/widgets.dart';

class UiParameters {
  static const iconSize = 20.0;
  static const screenPadding = EdgeInsets.symmetric(horizontal: 16.0);
  static const rowContentPadding = EdgeInsets.all(16.0);

  static const circleBorderRadius = BorderRadius.all(Radius.circular(1000.0));

  static const avatar = 150.0;

  static const imageSelectorHeight = 300.0;
  static const imageSelectorIconDimension = 200.0;
  static const imageSelectorUploadButtonHeight = 40.0;
  static const imageSelectorUploadButtonPadding =
      EdgeInsets.symmetric(horizontal: 20.0);
  static const borderRadius = BorderRadius.all(Radius.circular(24.0));
  static const radioListTileBorderRadius =
      BorderRadius.all(Radius.circular(12.0));

  static final tableBorder = TableBorder.all(
    borderRadius: borderRadius,
  );

  static const imagePadding = EdgeInsets.all(4.0);
  static const appBarSize = Size.fromHeight(60.0);
  static const lectureTabBarSize = Size.fromHeight(50.0);
  static const lottiesDimension = 300.0;

  // Course card
  static const courseCardLandscapePadding = EdgeInsets.all(8.0);
  static const courseCardPortraitPadding = EdgeInsets.all(4.0);
  static const courseCardPortraitSize = Size(200.0, 280.0);
  static const courseCardThumbnailDimension = 60.0;
  static const courseCardBorderRadius = BorderRadius.all(Radius.circular(6.0));

  // Course screen
  static const thumbnailBorderRadius = BorderRadius.all(Radius.circular(6.0));

  // Cart screen
  static const cartItemCardContentPadding = EdgeInsets.symmetric(
    horizontal: 16.0,
    vertical: 8.0,
  );
}
