import 'package:freezed_annotation/freezed_annotation.dart';

part 'lsupplier.freezed.dart';
part 'lsupplier.g.dart';

@freezed
class LSupplier with _$LSupplier {
  factory LSupplier({
    List<int>? id,
    List<String>? name,
    bool? error,
    String? message,
  }) = _LSupplier;

  factory LSupplier.fromJson(Map<String, dynamic> json) =>
      _$LSupplierFromJson(json);
}
