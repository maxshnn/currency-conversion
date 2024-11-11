import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency_symbol_model.g.dart';
part 'currency_symbol_model.freezed.dart';

@freezed
class CurrencySymbolModel with _$CurrencySymbolModel {
  const factory CurrencySymbolModel({
    required Map<String, String> currencies,
  }) = _CurrencySymbolModel;

  factory CurrencySymbolModel.fromJson(Map<String, Object?> json) =>
      _$CurrencySymbolModelFromJson(json);
}
