import 'package:freezed_annotation/freezed_annotation.dart';

part 'info_rate_model.g.dart';
part 'info_rate_model.freezed.dart';

@freezed
class InfoRateModel with _$InfoRateModel {
  const factory InfoRateModel({
    required int timestamp,
    @JsonKey(name: 'quote') required double rate,
  }) = _InfoRateModel;

  factory InfoRateModel.fromJson(Map<String, Object?> json) =>
      _$InfoRateModelFromJson(json);
}
