import 'package:freezed_annotation/freezed_annotation.dart';
part 'symbol.freezed.dart';

@freezed
class Symbol with _$Symbol {
  const factory Symbol({
    required String code,
    required String name,
  }) = _Symbol;
}
