import 'package:freezed_annotation/freezed_annotation.dart';

part 'editasset.freezed.dart';
part 'editasset.g.dart';

@freezed
class EditAsset with _$EditAsset {
  factory EditAsset({
    @Default('') String name,
    int? typeId,
    int? supplierID,
    int? locationID,
    int? brandID,
    int? status,
  }) = _EditAsset;

  factory EditAsset.fromJson(Map<String, dynamic> json) =>
      _$EditAssetFromJson(json);
}
