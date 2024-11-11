import 'package:freezed_annotation/freezed_annotation.dart';
part 'quote.freezed.dart';

@freezed
class Quote with _$Quote {
  const factory Quote({
    required String name,
    required double quote,
  }) = _Quote;
}
