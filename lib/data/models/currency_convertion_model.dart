import 'package:currency_conversion/data/models/info_rate_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency_convertion_model.g.dart';
part 'currency_convertion_model.freezed.dart';

@freezed
class CurrencyConvertionModel with _$CurrencyConvertionModel {
  const factory CurrencyConvertionModel({
    required double result,
    required InfoRateModel info,
  }) = _CurrencyConvertionModel;

  factory CurrencyConvertionModel.fromJson(Map<String, Object?> json) =>
      _$CurrencyConvertionModelFromJson(json);
}
