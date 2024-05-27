import 'package:json_annotation/json_annotation.dart';

part 'interaction.g.dart';

@JsonSerializable()
class Interaction {
  @JsonKey(name: 'prescription_id')
  final int prescriptionId;
  @JsonKey(name: 'prescription_drug')
  final String prescriptionDrug;
  final String drug;
  @JsonKey(name: 'prescription_scname')
  final String prescriptionScname;
  @JsonKey(name: 'scname')
  final String scname;
  final String state;
  @JsonKey(name: 'interaction_type')
  final List<String> interactionType;

  Interaction({
    required this.prescriptionId,
    required this.prescriptionDrug,
    required this.drug,
    required this.prescriptionScname,
    required this.scname,
    required this.state,
    required this.interactionType,
  });

  factory Interaction.fromJson(Map<String, dynamic> json) =>
      _$InteractionFromJson(json);

  Map<String, dynamic> toJson() => _$InteractionToJson(this);
}
