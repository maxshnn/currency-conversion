part of '../data.dart';

@freezed
@HiveType(typeId: 1)
class QuoteModel with _$QuoteModel {
  const QuoteModel._();

  const factory QuoteModel({
    @HiveField(0) required String name,
    @HiveField(1) required double quote,
  }) = _QuoteModel;

  factory QuoteModel.fromJson(Map<String, Object?> json) =>
      _$QuoteModelFromJson(json);
}
