part of 'currency_bloc.dart';

@freezed
class CurrencyEvent with _$CurrencyEvent {
  const factory CurrencyEvent.getLocalCurrencies() = _GetLocalCurrencies;
  const factory CurrencyEvent.getCurrencies() = _GetCurrencies;

  const factory CurrencyEvent.addValues({
    String? value,
    String? from,
    String? to,
  }) = _AddValues;

  const factory CurrencyEvent.submit() = _Submit;
}
