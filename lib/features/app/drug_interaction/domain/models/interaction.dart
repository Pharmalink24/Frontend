
class InteractionModel {
  
  final int prescriptionId;
  final String prescriptionDrug;
  final String drug;
  final String prescriptionScname;
  final String scname;
  final String state;
  final List<String> interactionType;

  InteractionModel({
    required this.prescriptionId,
    required this.prescriptionDrug,
    required this.drug,
    required this.prescriptionScname,
    required this.scname,
    required this.state,
    required this.interactionType,
  });
}
