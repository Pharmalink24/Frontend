import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:pharmalink/core/theme/colors.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theme/styles.dart';
import '../../models/on_boarding_page.dart';
import '../../models/on_boarding_pages.dart';
import 'intro_image.dart';

List<PageViewModel> listPagesViewModel = [];

List<PageViewModel> createListPagesViewModel(BuildContext context) {
  for (OnBoardingPageModel pageModel in onBoardingPages) {
    listPagesViewModel.add(
      PageViewModel(
        title: AppLocalizations.of(context).isEnLocale
            ? pageModel.title
            : pageModel.titleInArabic,
        body: AppLocalizations.of(context).isEnLocale
            ? pageModel.body
            : pageModel.bodyInArabic,
        image: IntroImage(path: pageModel.image),
        decoration: PageDecoration(
          titleTextStyle: AppTextStyle.headlineLarge(context).copyWith(
            fontWeight: FontWeight.w700,
          ),
          bodyTextStyle: AppTextStyle.labelSmall(context)
              .copyWith(fontSize: 16.0, fontWeight: FontWeight.w700),
          pageColor: context.colorScheme.surface,
          imagePadding: const EdgeInsets.all(0.0),
          imageFlex: 7,
          bodyFlex: 5,
          footerFlex: 1,
        ),
      ),
    );
  }

  return listPagesViewModel;
}
