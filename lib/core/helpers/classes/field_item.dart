import 'package:pharmalink/core/localization/localization.dart';

class DropDownFieldItem {
  final String key;
  late String value;
  final String? valueInArabic;

  DropDownFieldItem({
    required this.key,
    required this.value,
    this.valueInArabic,
  }){
    value = isArabic() ? valueInArabic ?? value : value;
  }
}