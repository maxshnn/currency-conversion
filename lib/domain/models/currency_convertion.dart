import 'package:freezed_annotation/freezed_annotation.dart';
part 'currency_convertion.freezed.dart';

@freezed
class CurrencyConvertion with _$CurrencyConvertion {
  const factory CurrencyConvertion({
    required double result,
    required double rate,
  }) = _CurrencyConvertion;
}
