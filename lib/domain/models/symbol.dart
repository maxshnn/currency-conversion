part of '../domain.dart';

@freezed
class Symbol with _$Symbol {
  const factory Symbol({
    required String code,
    required String name,
  }) = _Symbol;
}
