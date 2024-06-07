

class DrugSearchResultModel {
  final int id;
  final String tradeName;
  final String drugEyeId;
  final String activeIngredient;
  final int quantity;
  final String unit;
  final String classification;

  DrugSearchResultModel({
    required this.id,
    required this.tradeName,
    required this.drugEyeId,
    required this.activeIngredient,
    required this.quantity,
    required this.unit,
    required this.classification,
  });

}
