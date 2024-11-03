part of '../data.dart';

interface class CurrencyConversionRepositoryImpl
    implements CurrencyConversionRepository {
  final CurrencyConversionService _currencyConversionService;
  final CurrencyQuotesLocal _currencyQuotesLocal;
  final Mappr _mapper;
  CurrencyConversionRepositoryImpl({
    required CurrencyConversionService currencyConversionService,
    required CurrencyQuotesLocal currencyQuotesLocal,
    required Mappr mapper,
  })  : _currencyConversionService = currencyConversionService,
        _currencyQuotesLocal = currencyQuotesLocal,
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
    // var result = _butifyCurrencyQuotes(base: base, model: data);
    // await _currencyQuotesLocal.updateCurrencyQuotes(result);
    return _mapper.convert<CurrencyQuotesModel, CurrencyQuotes>(data);
  }

  @override
  Future<CurrencyQuotes?> getLocalCurrencyQuote({
    required String base,
    double amount = 1,
  }) async {
    var data = await _currencyQuotesLocal.getCurrencyQuotes();
    return _mapper.tryConvert<CurrencyQuotesModel, CurrencyQuotes>(data);
  }

  @override
  Future<void> updateLocalCurrencyQuote({required CurrencyQuotes data}) async {
    var result = _mapper.convert<CurrencyQuotes, CurrencyQuotesModel>(data);
    return await _currencyQuotesLocal.updateCurrencyQuotes(result);
  }

  CurrencyQuotesModel _butifyCurrencyQuotes({
    required String base,
    required CurrencyQuotesModel model,
  }) {
    var quotes = model.quotes
        .map<QuoteModel>(
          (quote) => quote.copyWith(
            name: quote.name.replaceFirst(base, ''),
          ),
        )
        .toList();
    return model.copyWith(quotes: quotes);
  }
}
