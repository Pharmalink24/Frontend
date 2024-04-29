import 'package:pharmalink/core/localization/localization.dart';

class OnBoardingPageModel {
  late String title;
  late String body;
  final String image;
  final String titleInArabic;
  final String bodyInArabic;

  OnBoardingPageModel({
    required this.title,
    required this.body,
    required this.image,
    required this.titleInArabic,
    required this.bodyInArabic,
  }){
    title = isArabic() ? titleInArabic : title;
    body = isArabic() ? bodyInArabic : body;
  }
}
