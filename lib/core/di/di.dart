import 'package:currency_conversion/data/data.dart';
import 'package:currency_conversion/domain/domain.dart';
import 'package:currency_conversion/hive_registrar.g.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_ce/hive.dart';
import 'package:path_provider/path_provider.dart';

final injection = GetIt.instance;

Future<void> setDependencyInjection() async {
  final dir = await getApplicationDocumentsDirectory();
  Hive
    ..init(dir.path)
    ..registerAdapters();
  final currencyQuotesBox =
      await Hive.openBox<CurrencyQuotesModel>('currency_quotes');

  final dio = Dio(
    BaseOptions(
      headers: {
        Headers.contentTypeHeader: Headers.jsonContentType,
      },
    ),
  )..interceptors.add(
      AppInterceptor(),
    );

  injection
    ..registerLazySingleton<Dio>(() => dio)
    ..registerLazySingleton<Mappr>(() => Mappr())
    ..registerLazySingleton<CurrencyConversionService>(
      () => CurrencyConversionService(
        injection(),
      ),
    )
    // ..registerLazySingletonAsync(
    //   () async => ,
    // )
    ..registerLazySingleton<CurrencyQuotesLocal>(
      () => CurrencyQuotesLocal(
        box: currencyQuotesBox,
      ),
    )
    ..registerLazySingleton<CurrencyConversionRepository>(
      () => CurrencyConversionRepositoryImpl(
        currencyConversionService: injection(),
        currencyQuotesLocal: injection(),
        mapper: injection(),
      ),
    )
    ..registerLazySingleton<CurrencyConversionUseCase>(
      () => CurrencyConversionUseCase(
        currencyConversionRepository: injection(),
      ),
    );
}
