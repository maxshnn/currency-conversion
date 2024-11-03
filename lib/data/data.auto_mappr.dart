// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoMapprGenerator
// **************************************************************************

// ignore_for_file: type=lint, unnecessary_cast, unused_local_variable

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_mappr_annotation/auto_mappr_annotation.dart' as _i1;

import '../domain/domain.dart' as _i3;
import 'data.dart' as _i2;

/// {@template package:currency_conversion/data/data.dart}
/// Available mappings:
/// - `CurrencyConvertionModel` → `CurrencyConvertion`.
/// - `CurrencySymbolModel` → `CurrencySymbol`.
/// - `CurrencyQuotesModel` → `CurrencyQuotes`.
/// - `CurrencyQuotes` → `CurrencyQuotesModel`.
/// - `QuoteModel` → `Quote`.
/// - `Quote` → `QuoteModel`.
/// {@endtemplate}
class $Mappr implements _i1.AutoMapprInterface {
  const $Mappr();

  Type _typeOf<T>() => T;

  List<_i1.AutoMapprInterface> get _delegates => const [];

  /// {@macro AutoMapprInterface:canConvert}
  /// {@macro package:currency_conversion/data/data.dart}
  @override
  bool canConvert<SOURCE, TARGET>({bool recursive = true}) {
    final sourceTypeOf = _typeOf<SOURCE>();
    final targetTypeOf = _typeOf<TARGET>();
    if ((sourceTypeOf == _typeOf<_i2.CurrencyConvertionModel>() ||
            sourceTypeOf == _typeOf<_i2.CurrencyConvertionModel?>()) &&
        (targetTypeOf == _typeOf<_i3.CurrencyConvertion>() ||
            targetTypeOf == _typeOf<_i3.CurrencyConvertion?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i2.CurrencySymbolModel>() ||
            sourceTypeOf == _typeOf<_i2.CurrencySymbolModel?>()) &&
        (targetTypeOf == _typeOf<_i3.CurrencySymbol>() ||
            targetTypeOf == _typeOf<_i3.CurrencySymbol?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i2.CurrencyQuotesModel>() ||
            sourceTypeOf == _typeOf<_i2.CurrencyQuotesModel?>()) &&
        (targetTypeOf == _typeOf<_i3.CurrencyQuotes>() ||
            targetTypeOf == _typeOf<_i3.CurrencyQuotes?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i3.CurrencyQuotes>() ||
            sourceTypeOf == _typeOf<_i3.CurrencyQuotes?>()) &&
        (targetTypeOf == _typeOf<_i2.CurrencyQuotesModel>() ||
            targetTypeOf == _typeOf<_i2.CurrencyQuotesModel?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i2.QuoteModel>() ||
            sourceTypeOf == _typeOf<_i2.QuoteModel?>()) &&
        (targetTypeOf == _typeOf<_i3.Quote>() ||
            targetTypeOf == _typeOf<_i3.Quote?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i3.Quote>() ||
            sourceTypeOf == _typeOf<_i3.Quote?>()) &&
        (targetTypeOf == _typeOf<_i2.QuoteModel>() ||
            targetTypeOf == _typeOf<_i2.QuoteModel?>())) {
      return true;
    }
    if (recursive) {
      for (final mappr in _delegates) {
        if (mappr.canConvert<SOURCE, TARGET>()) {
          return true;
        }
      }
    }
    return false;
  }

  /// {@macro AutoMapprInterface:convert}
  /// {@macro package:currency_conversion/data/data.dart}
  @override
  TARGET convert<SOURCE, TARGET>(SOURCE? model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return _convert(model)!;
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convert(model)!;
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// {@macro AutoMapprInterface:tryConvert}
  /// {@macro package:currency_conversion/data/data.dart}
  @override
  TARGET? tryConvert<SOURCE, TARGET>(
    SOURCE? model, {
    void Function(Object error, StackTrace stackTrace, SOURCE? source)?
        onMappingError,
  }) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return _safeConvert(
        model,
        onMappingError: onMappingError,
      );
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvert(
          model,
          onMappingError: onMappingError,
        );
      }
    }

    return null;
  }

  /// {@macro AutoMapprInterface:convertIterable}
  /// {@macro package:currency_conversion/data/data.dart}
  @override
  Iterable<TARGET> convertIterable<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return model.map<TARGET>((item) => _convert(item)!);
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convertIterable(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// For iterable items, converts from SOURCE to TARGET if such mapping is configured, into Iterable.
  ///
  /// When an item in the source iterable is null, uses `whenSourceIsNull` if defined or null
  ///
  /// {@macro package:currency_conversion/data/data.dart}
  @override
  Iterable<TARGET?> tryConvertIterable<SOURCE, TARGET>(
    Iterable<SOURCE?> model, {
    void Function(Object error, StackTrace stackTrace, SOURCE? source)?
        onMappingError,
  }) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return model.map<TARGET?>(
          (item) => _safeConvert(item, onMappingError: onMappingError));
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvertIterable(
          model,
          onMappingError: onMappingError,
        );
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// {@macro AutoMapprInterface:convertList}
  /// {@macro package:currency_conversion/data/data.dart}
  @override
  List<TARGET> convertList<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return convertIterable<SOURCE, TARGET>(model).toList();
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convertList(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// For iterable items, converts from SOURCE to TARGET if such mapping is configured, into List.
  ///
  /// When an item in the source iterable is null, uses `whenSourceIsNull` if defined or null
  ///
  /// {@macro package:currency_conversion/data/data.dart}
  @override
  List<TARGET?> tryConvertList<SOURCE, TARGET>(
    Iterable<SOURCE?> model, {
    void Function(Object error, StackTrace stackTrace, SOURCE? source)?
        onMappingError,
  }) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return tryConvertIterable<SOURCE, TARGET>(
        model,
        onMappingError: onMappingError,
      ).toList();
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvertList(
          model,
          onMappingError: onMappingError,
        );
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// {@macro AutoMapprInterface:convertSet}
  /// {@macro package:currency_conversion/data/data.dart}
  @override
  Set<TARGET> convertSet<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return convertIterable<SOURCE, TARGET>(model).toSet();
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convertSet(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// For iterable items, converts from SOURCE to TARGET if such mapping is configured, into Set.
  ///
  /// When an item in the source iterable is null, uses `whenSourceIsNull` if defined or null
  ///
  /// {@macro package:currency_conversion/data/data.dart}
  @override
  Set<TARGET?> tryConvertSet<SOURCE, TARGET>(
    Iterable<SOURCE?> model, {
    void Function(Object error, StackTrace stackTrace, SOURCE? source)?
        onMappingError,
  }) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return tryConvertIterable<SOURCE, TARGET>(
        model,
        onMappingError: onMappingError,
      ).toSet();
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvertSet(
          model,
          onMappingError: onMappingError,
        );
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  TARGET? _convert<SOURCE, TARGET>(
    SOURCE? model, {
    bool canReturnNull = false,
  }) {
    final sourceTypeOf = _typeOf<SOURCE>();
    final targetTypeOf = _typeOf<TARGET>();
    if ((sourceTypeOf == _typeOf<_i2.CurrencyConvertionModel>() ||
            sourceTypeOf == _typeOf<_i2.CurrencyConvertionModel?>()) &&
        (targetTypeOf == _typeOf<_i3.CurrencyConvertion>() ||
            targetTypeOf == _typeOf<_i3.CurrencyConvertion?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i2$CurrencyConvertionModel_To__i3$CurrencyConvertion(
          (model as _i2.CurrencyConvertionModel?)) as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i2.CurrencySymbolModel>() ||
            sourceTypeOf == _typeOf<_i2.CurrencySymbolModel?>()) &&
        (targetTypeOf == _typeOf<_i3.CurrencySymbol>() ||
            targetTypeOf == _typeOf<_i3.CurrencySymbol?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i2$CurrencySymbolModel_To__i3$CurrencySymbol(
          (model as _i2.CurrencySymbolModel?)) as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i2.CurrencyQuotesModel>() ||
            sourceTypeOf == _typeOf<_i2.CurrencyQuotesModel?>()) &&
        (targetTypeOf == _typeOf<_i3.CurrencyQuotes>() ||
            targetTypeOf == _typeOf<_i3.CurrencyQuotes?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i2$CurrencyQuotesModel_To__i3$CurrencyQuotes(
          (model as _i2.CurrencyQuotesModel?)) as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i3.CurrencyQuotes>() ||
            sourceTypeOf == _typeOf<_i3.CurrencyQuotes?>()) &&
        (targetTypeOf == _typeOf<_i2.CurrencyQuotesModel>() ||
            targetTypeOf == _typeOf<_i2.CurrencyQuotesModel?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i3$CurrencyQuotes_To__i2$CurrencyQuotesModel(
          (model as _i3.CurrencyQuotes?)) as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i2.QuoteModel>() ||
            sourceTypeOf == _typeOf<_i2.QuoteModel?>()) &&
        (targetTypeOf == _typeOf<_i3.Quote>() ||
            targetTypeOf == _typeOf<_i3.Quote?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i2$QuoteModel_To__i3$Quote((model as _i2.QuoteModel?))
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i3.Quote>() ||
            sourceTypeOf == _typeOf<_i3.Quote?>()) &&
        (targetTypeOf == _typeOf<_i2.QuoteModel>() ||
            targetTypeOf == _typeOf<_i2.QuoteModel?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i3$Quote_To__i2$QuoteModel((model as _i3.Quote?))
          as TARGET);
    }
    throw Exception('No ${model.runtimeType} -> $targetTypeOf mapping.');
  }

  TARGET? _safeConvert<SOURCE, TARGET>(
    SOURCE? model, {
    void Function(Object error, StackTrace stackTrace, SOURCE? source)?
        onMappingError,
  }) {
    if (!useSafeMapping<SOURCE, TARGET>()) {
      return _convert(
        model,
        canReturnNull: true,
      );
    }
    try {
      return _convert(
        model,
        canReturnNull: true,
      );
    } catch (e, s) {
      onMappingError?.call(e, s, model);
      return null;
    }
  }

  /// {@macro AutoMapprInterface:useSafeMapping}
  /// {@macro package:currency_conversion/data/data.dart}
  @override
  bool useSafeMapping<SOURCE, TARGET>() {
    return false;
  }

  _i3.CurrencyConvertion
      _map__i2$CurrencyConvertionModel_To__i3$CurrencyConvertion(
          _i2.CurrencyConvertionModel? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping CurrencyConvertionModel → CurrencyConvertion failed because CurrencyConvertionModel was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<CurrencyConvertionModel, CurrencyConvertion> to handle null values during mapping.');
    }
    return _i3.CurrencyConvertion(
      result: model.result,
      rate: _i2.Mappr.fromInfoToDouble(model),
    );
  }

  _i3.CurrencySymbol _map__i2$CurrencySymbolModel_To__i3$CurrencySymbol(
      _i2.CurrencySymbolModel? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping CurrencySymbolModel → CurrencySymbol failed because CurrencySymbolModel was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<CurrencySymbolModel, CurrencySymbol> to handle null values during mapping.');
    }
    return _i3.CurrencySymbol(symbols: _i2.Mappr.fromMapToString(model));
  }

  _i3.CurrencyQuotes _map__i2$CurrencyQuotesModel_To__i3$CurrencyQuotes(
      _i2.CurrencyQuotesModel? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping CurrencyQuotesModel → CurrencyQuotes failed because CurrencyQuotesModel was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<CurrencyQuotesModel, CurrencyQuotes> to handle null values during mapping.');
    }
    return _i3.CurrencyQuotes(
        quotes: model.quotes
            .map<_i3.Quote>((value) => _map__i2$QuoteModel_To__i3$Quote(value))
            .toList());
  }

  _i2.CurrencyQuotesModel _map__i3$CurrencyQuotes_To__i2$CurrencyQuotesModel(
      _i3.CurrencyQuotes? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping CurrencyQuotes → CurrencyQuotesModel failed because CurrencyQuotes was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<CurrencyQuotes, CurrencyQuotesModel> to handle null values during mapping.');
    }
    return _i2.CurrencyQuotesModel(
        quotes: model.quotes
            .map<_i2.QuoteModel>(
                (value) => _map__i3$Quote_To__i2$QuoteModel(value))
            .toList());
  }

  _i3.Quote _map__i2$QuoteModel_To__i3$Quote(_i2.QuoteModel? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping QuoteModel → Quote failed because QuoteModel was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<QuoteModel, Quote> to handle null values during mapping.');
    }
    return _i3.Quote(
      name: model.name,
      quote: model.quote,
    );
  }

  _i2.QuoteModel _map__i3$Quote_To__i2$QuoteModel(_i3.Quote? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping Quote → QuoteModel failed because Quote was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<Quote, QuoteModel> to handle null values during mapping.');
    }
    return _i2.QuoteModel(
      name: model.name,
      quote: model.quote,
    );
  }
}
