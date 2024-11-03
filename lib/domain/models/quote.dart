part of '../domain.dart';

@freezed
class Quote with _$Quote {
  const factory Quote({
    required String name,
    required double quote,
  }) = _Quote;
}
