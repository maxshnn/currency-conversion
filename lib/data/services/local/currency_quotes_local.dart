part of '../../data.dart';

class CurrencyQuotesLocal {
  final Box<CurrencyQuotesModel> _box;
  CurrencyQuotesLocal({
    required Box<CurrencyQuotesModel> box,
  }) : _box = box;

  String get _key => 'currency_quotes';

  Future<QuoteModel?> getQuote(String name) async {
    var data = _box.get(_key);
    return data?.quotes.firstWhere(
      (quote) => quote.name == name,
    );
  }

  Future<CurrencyQuotesModel?> getCurrencyQuotes() async {
    return _box.get(_key);
  }

  Future<void> updateCurrencyQuotes(CurrencyQuotesModel data) async {
    await _box.put(_key, data);
  }
}
