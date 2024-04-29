// Typography
import 'package:pharmalink/core/localization/localization.dart';

class AppFonts {
  static String primary = !isArabic() ? 'Outfit' : 'Amiri';
  static String secondary = !isArabic() ? 'Readex Pro' : 'Cairo';
  static String tertiary = !isArabic() ? 'Plus Jakarta Sans' : 'Cairo';
}
