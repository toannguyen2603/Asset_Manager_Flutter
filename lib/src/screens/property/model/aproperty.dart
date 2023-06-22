import 'package:freezed_annotation/freezed_annotation.dart';

part 'aproperty.freezed.dart';
part 'aproperty.g.dart';

@freezed
class AProperty with _$AProperty {
  factory AProperty({
    @Default(0) int id,
    String? name,
    String? tag,
    String? type,
    String? supplier,
    String? brand,
    String? serial,
    String? location,
    @Default(0) int cost,
    @Default(0) int warranty,
    int? status,
    String? description,
    DateTime? createDay,
    DateTime? updateDay,
    String? image,
    @Default(false) bool isCheckOut,
    @Default(false) bool error,
    @Default('') String message,
    DateTime? purchaseDay,
  }) = _AProperty;

  factory AProperty.fromJson(Map<String, dynamic> json) =>
      _$APropertyFromJson(json);
}
