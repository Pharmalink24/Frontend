// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part "drug_search.g.dart";

@JsonSerializable()
class DrugSearch {
  final int id;
  @JsonKey(name: "TradeName")
  final String tradeName;
  @JsonKey(name: "ID")
  final String drugEyeId;
  @JsonKey(name: "ScName")
  final String activeIngredient;
  @JsonKey(name: "HOWMUCH")
  final int quantity;
  @JsonKey(name: "Unit")
  final String unit;
  @JsonKey(name: "CLASSIFICATION")
  final String classification;

  DrugSearch({
    required this.id,
    required this.tradeName,
    required this.drugEyeId,
    required this.activeIngredient,
    required this.quantity,
    required this.unit,
    required this.classification,
  });

  factory DrugSearch.fromJson(Map<String, dynamic> json) =>
      _$DrugSearchFromJson(json);

  Map<String, dynamic> toJson() => _$DrugSearchToJson(this);
}
