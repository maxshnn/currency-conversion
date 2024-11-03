part of '../data.dart';

@freezed
class InfoRateModel with _$InfoRateModel {
  const factory InfoRateModel({
    required int timestamp,
    @JsonKey(name: 'quote') required double rate,
  }) = _InfoRateModel;

  factory InfoRateModel.fromJson(Map<String, Object?> json) =>
      _$InfoRateModelFromJson(json);
}
