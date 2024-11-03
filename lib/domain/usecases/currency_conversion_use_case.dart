part of '../domain.dart';

class CurrencyConversionUseCase {
  final CurrencyConversionRepository _currencyConversionRepository;
  CurrencyConversionUseCase({
    required CurrencyConversionRepository currencyConversionRepository,
  }) : _currencyConversionRepository = currencyConversionRepository;

  String get _baseCurrency => 'USD';

  Future<CurrencyConvertion?> convertCurrency({
    required String from,
    required String to,
    required double amount,
  }) async {
    try {
      var data = await _currencyConversionRepository.convertCurrency(
        from: from,
        to: to,
        amount: amount,
      );
      var result = data.copyWith(
        result: _roundToTenthousandths(
          data.result,
        ),
      );

      return result;
    } on DioException catch (_) {
      return await localConvertCurrency(
        from: from,
        to: to,
        amount: amount,
      );
    }
  }

  Future<CurrencySymbol?> getAllCurrencies() async {
    var data = await _currencyConversionRepository.getCurrencyQuotes(
        base: _baseCurrency);
    var result = _butifyCurrencyQuotes(base: _baseCurrency, data: data);

    result = result?.copyWith(
      quotes: [
        ...result.quotes,
        Quote(name: _baseCurrency, quote: 1.0),
      ],
    );
    result = _sortCurrencyQuotes(result);

    if (result != null) {
      await _currencyConversionRepository.updateLocalCurrencyQuote(
        data: result,
      );
    }
    return _fromCurrencyQuotesToCurrencySymbol(data: result);
  }

  Future<CurrencyConvertion?> localConvertCurrency({
    required String from,
    required String to,
    required double amount,
  }) async {
    var data = await _currencyConversionRepository.getLocalCurrencyQuote(
        base: _baseCurrency);

    if (data == null) return null;

    double? valueFrom = data.quotes
        .firstWhere(
          (element) => element.name == from,
        )
        .quote;
    double? valueTo = data.quotes
        .firstWhere(
          (quote) => quote.name == to,
        )
        .quote;

    double rate = amount / valueFrom;

    double convertedAmount = rate * valueTo;

    return CurrencyConvertion(
        result: _roundToTenthousandths(convertedAmount), rate: rate);
  }

  Future<CurrencySymbol?> getLocalAllCurrencies() async {
    var data = await _currencyConversionRepository.getLocalCurrencyQuote(
        base: _baseCurrency);
    return _fromCurrencyQuotesToCurrencySymbol(data: data);
  }

  // helpers

  CurrencyQuotes? _sortCurrencyQuotes(CurrencyQuotes? model) {
    if (model == null) return null;

    var sortedQuotes = model.quotes.toList()
      ..sort((a, b) => a.name.compareTo(b.name));

    return model.copyWith(quotes: sortedQuotes);
  }

  CurrencySymbol? _fromCurrencyQuotesToCurrencySymbol({
    required CurrencyQuotes? data,
  }) {
    if (data == null) return null;
    List<String> symbols = data.quotes
        .map(
          (quote) => quote.name,
        )
        .toList();
    return CurrencySymbol(symbols: symbols);
  }

  CurrencyQuotes? _butifyCurrencyQuotes({
    required String base,
    required CurrencyQuotes? data,
  }) {
    if (data == null) return null;
    var quotes = data.quotes.map<Quote>(
      (quote) {
        if (quote.name == base) {
          return quote;
        }
        return quote.copyWith(
          name: quote.name.replaceFirst(base, ''),
        );
      },
    ).toList();
    return data.copyWith(quotes: quotes);
  }

  double _roundToTenthousandths(double value) {
    return (value * 100).round() / 100;
  }
}
