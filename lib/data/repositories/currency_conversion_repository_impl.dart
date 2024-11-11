part of '../data.dart';

class CurrencyConversionRepositoryImpl implements CurrencyConversionRepository {
  final CurrencyConversionService _currencyConversionService;
  final Mappr _mapper;
  CurrencyConversionRepositoryImpl({
    required CurrencyConversionService currencyConversionService,
    required Mappr mapper,
  })  : _currencyConversionService = currencyConversionService,
        _mapper = mapper;

  String get _accessKey => ApiKeys.apiLayerKey;

  @override
  Future<CurrencySymbol> getAllCurrencies() async {
    // Получает список всех валют
    var data = await _currencyConversionService.fetchAllCurrencies(
      accessKey: _accessKey,
    );
    return _mapper.convert<CurrencySymbolModel, CurrencySymbol>(data);
  }

  @override
  Future<CurrencyConvertion> convertCurrency({
    // Конвертирует валюту
    required String from,
    required String to,
    required double amount,
  }) async {
    var data = await _currencyConversionService.convertCurrency(
      accessKey: _accessKey,
      from: from,
      to: to,
      amount: amount,
    );
    return _mapper.convert<CurrencyConvertionModel, CurrencyConvertion>(data);
  }

  @override
  Future<CurrencyQuotes?> getCurrencyQuotes({
    // Получает актуальный курс по отншению доллара
    required String base,
    double amount = 1,
  }) async {
    var data = await _currencyConversionService.currencyQuotes(
      accessKey: _accessKey,
      base: base,
    );
    return _mapper.convert<CurrencyQuotesModel, CurrencyQuotes>(data);
  }

  // CurrencyQuotesModel _butifyCurrencyQuotes({
  //   required String base,
  //   required CurrencyQuotesModel model,
  // }) {
  //   var quotes = model.quotes
  //       .map<QuoteModel>(
  //         (quote) => quote.copyWith(
  //           name: quote.name.replaceFirst(base, ''),
  //         ),
  //       )
  //       .toList();
  //   return model.copyWith(quotes: quotes);
  // }
}
