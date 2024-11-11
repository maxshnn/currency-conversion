part of 'currency_bloc.dart';

@freezed
class CurrencyState with _$CurrencyState {
  const factory CurrencyState({
    @Default(ProgressStatus.initial) ProgressStatus status,
    String? from,
    String? to,
    double? amount,
    @Default([]) List<String> symbols,
    double? result,
    String? error,
  }) = _CurrencyState;
  // const factory CurrencyState.initial() = _Initial;
  // const factory CurrencyState.success({
  //   required CurrencySymbol allCurrency,
  // }) = _Success;
  // const factory CurrencyState.loading() = _Loading;
  // const factory CurrencyState.failure() = _Failure;
}
