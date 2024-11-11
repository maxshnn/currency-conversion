import 'package:bloc/bloc.dart';
import 'package:currency_conversion/domain/domain.dart';
import 'package:currency_conversion/presentation/resources/enums.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency_event.dart';
part 'currency_state.dart';
part 'currency_bloc.freezed.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  final CurrencyConversionUseCase _currencyConversionUseCase;

  CurrencyBloc({required CurrencyConversionUseCase currencyConversionUseCase})
      : _currencyConversionUseCase = currencyConversionUseCase,
        super(const CurrencyState()) {
    on<_GetCurrencies>(_onGetCurrencies);
    on<_GetLocalCurrencies>(_onGetLocalCurrencies);
    on<_AddValues>(_onAddValues);
    on<_Submit>(_onSubmit);
  }

  Future<void> _onAddValues(_AddValues event, Emitter emit) async {
    double? amount = double.tryParse(event.value ?? '');
    emit(state.copyWith(
      amount: amount ?? state.amount,
      to: event.to ?? state.to,
      from: event.from ?? state.from,
    ));
  }

  Future<void> _onGetCurrencies(
    _GetCurrencies event,
    Emitter emit,
  ) async {
    try {
      var currencies = await _currencyConversionUseCase.getAllCurrencies();
      emit(
        state.copyWith(
          status: ProgressStatus.success,
          symbols: currencies?.symbols ?? [],
        ),
      );
    } on DioException catch (e) {
      _emitError(emit, e);
    }
  }

  Future<void> _onGetLocalCurrencies(
    _GetLocalCurrencies event,
    Emitter emit,
  ) async {
    var currencies = await _currencyConversionUseCase.getLocalAllCurrencies();
    emit(
      state.copyWith(
        status: ProgressStatus.success,
        symbols: currencies!.symbols,
      ),
    );
  }

  Future<void> _onSubmit(_Submit event, Emitter emit) async {
    try {
      double? amount = state.amount;
      String? from = state.from;
      String? to = state.to;

      emit(
        state.copyWith(
          from: from,
          to: to,
          amount: amount,
        ),
      );
      if (amount == null || from == null || to == null) return;

      emit(
        state.copyWith(
          status: ProgressStatus.loading,
        ),
      );
      var data = await _currencyConversionUseCase.convertCurrency(
          from: from, to: to, amount: amount);
      emit(
        state.copyWith(
          result: data?.result,
          status: ProgressStatus.success,
        ),
      );
    } on DioException catch (e) {
      _emitError(emit, e);
    }
  }

  void _emitError(Emitter emit, DioException error) {
    emit(
      state.copyWith(
        error: error.message,
        status: ProgressStatus.failure,
      ),
    );
  }
}
