// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:pharmalink/core/enums/drug_state.dart';

part "drug_info.g.dart";

@JsonSerializable()
class DrugInfo {
  @JsonKey(name: "DrugEye")
  final int drugEye;
  @JsonKey(name: "ScName")
  final String scName;
  @JsonKey(name: "ScNameComponents")
  final List<String> scNameComponents;
  @JsonKey(name: "start_date")
  final String startDate;
  @JsonKey(name: "end_date")
  final String endDate;
  @JsonKey(name: "dosage")
  final double dosage;
  @JsonKey(name: "dosage_unit")
  final String dosageUnit;
  final int course;
  final int repetition;
  final int per;

  final DrugState state;

  const DrugInfo({
    required this.drugEye,
    required this.scName,
    required this.scNameComponents,
    required this.startDate,
    required this.endDate,
    required this.dosage,
    required this.dosageUnit,
    required this.course,
    required this.repetition,
    required this.per,
    required this.state,
  });

  factory DrugInfo.fromJson(Map<String, dynamic> json) =>
      _$DrugInfoFromJson(json);

  Map<String, dynamic> toJson() => _$DrugInfoToJson(this);
}
