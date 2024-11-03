part of '../data.dart';

@freezed
class CurrencySymbolModel with _$CurrencySymbolModel {
  const factory CurrencySymbolModel({
    required Map<String, String> currencies,
  }) = _CurrencySymbolModel;

  factory CurrencySymbolModel.fromJson(Map<String, Object?> json) =>
      _$CurrencySymbolModelFromJson(json);
}
