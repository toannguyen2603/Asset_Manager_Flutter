import 'package:freezed_annotation/freezed_annotation.dart';

part 'lmaintenance.freezed.dart';
part 'lmaintenance.g.dart';

@freezed
class LMaintenance with _$LMaintenance {
  factory LMaintenance({
    @Default(0) int id,
    String? asset,
    String? message,
    String? supplier,
    @Default(0) type,
    @Default(bool) error,
    DateTime? startDate,
    DateTime? endDate,
  }) = _LMaintenance;

  factory LMaintenance.fromJson(Map<String, dynamic> json) =>
      _$LMaintenanceFromJson(json);
}
