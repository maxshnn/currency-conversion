part of '../../data.dart';

@RestApi(baseUrl: ApiRoutes.apiLayer)
abstract class CurrencyConversionService {
  factory CurrencyConversionService(Dio dio) = _CurrencyConversionService;

  @GET(ApiRoutes.list)
  Future<CurrencySymbolModel> fetchAllCurrencies({
    @Header('apikey') required String accessKey,
  });

  @GET(ApiRoutes.convert)
  Future<CurrencyConvertionModel> convertCurrency({
    @Header('apikey') required String accessKey,
    @Query('from') required String from,
    @Query('to') required String to,
    @Query('amount') required double amount,
  });

  @GET(ApiRoutes.live)
  Future<CurrencyQuotesModel> currencyQuotes({
    @Header('apikey') required String accessKey,
    @Query('base') required String base,
  });
}
