import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';

part 'quote_model.g.dart';
part 'quote_model.freezed.dart';

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
