import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');
  AssetGenImage get logo_splash =>
      const AssetGenImage('assets/images/logo_splash.png');

  /// List of all assets
  List<AssetGenImage> get values => [logo, logo_splash];
}

class Assets {
  Assets._();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsLottiesGen lotties = $AssetsLottiesGen();
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/warning_96.json
  AssetGenImage get warning =>
      const AssetGenImage('assets/icons/warning_96.png');

  AssetGenImage get cancel => const AssetGenImage('assets/icons/cancel.png');

  AssetGenImage get email => const AssetGenImage('assets/icons/gmail.png');

  AssetGenImage get logout =>
      const AssetGenImage('assets/icons/x50/logout.png');

  AssetGenImage get role => const AssetGenImage('assets/icons/x50/role.png');

  AssetGenImage get phone => const AssetGenImage('assets/icons/x50/phone.png');

  AssetGenImage get status =>
      const AssetGenImage('assets/icons/x50/logout.png');
}

class $AssetsLottiesGen {
  const $AssetsLottiesGen();

  /// File path: assets/lotties/empty.json
  String get loading => 'assets/lotties/loading.json';
    String get success => 'assets/lotties/success.json';

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

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}
