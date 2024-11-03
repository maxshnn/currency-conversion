part of '../data.dart';

@freezed
class CurrencyConvertionModel with _$CurrencyConvertionModel {
  const factory CurrencyConvertionModel({
    required double result,
    required InfoRateModel info,
  }) = _CurrencyConvertionModel;

  factory CurrencyConvertionModel.fromJson(Map<String, Object?> json) =>
      _$CurrencyConvertionModelFromJson(json);
}
