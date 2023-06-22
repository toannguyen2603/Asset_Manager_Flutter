
import 'package:freezed_annotation/freezed_annotation.dart';

part 'leditproperty.freezed.dart';
part 'leditproperty.g.dart';

@freezed
class LEditProperty with _$LEditProperty {
  factory LEditProperty({
    @Default(1) int status,
    String? description,
  }) = _LEditProperty;
	
  factory LEditProperty.fromJson(Map<String, dynamic> json) =>
			_$LEditPropertyFromJson(json);
}

