part of '../data.dart';

class CurrencyQuoteLocalRepositoryImpl implements CurrencyQuoteLocalRepository {
  final Mappr _mapper;
  final CurrencyQuotesLocal _currencyQuotesLocal;

  CurrencyQuoteLocalRepositoryImpl({
    required Mappr mapper,
    required CurrencyQuotesLocal currencyQuotesLocal,
  })  : _mapper = mapper,
        _currencyQuotesLocal = currencyQuotesLocal;

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
}
