import 'package:currency_conversion/data/models/quote_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';

part 'currensy_quotes_model.g.dart';
part 'currensy_quotes_model.freezed.dart';

@freezed
@HiveType(typeId: 0)
class CurrencyQuotesModel with _$CurrencyQuotesModel {
  const CurrencyQuotesModel._();

  const factory CurrencyQuotesModel({
    @JsonKey(
      fromJson: CurrencyQuotesModel.mapToQuoteList,
      toJson: CurrencyQuotesModel.listQuotesToMap,
    )
    @HiveField(0)
    required List<QuoteModel> quotes,
  }) = _CurrencyQuotesModel;

  factory CurrencyQuotesModel.fromJson(Map<String, Object?> json) =>
      _$CurrencyQuotesModelFromJson(json);

  // Custom serializer
  static List<QuoteModel> mapToQuoteList(Map<String, Object?> json) {
    return json.entries.map((entry) {
      return QuoteModel(
        name: entry.key,
        quote: double.parse(entry.value.toString()),
      );
    }).toList();
  }

  static Map<String, double> listQuotesToMap(List<QuoteModel> model) {
    return {for (var quote in model) quote.name: quote.quote};
  }
}
