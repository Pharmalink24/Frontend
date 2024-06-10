import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pharmalink/core/routes/app_router.dart';
import 'package:pharmalink/core/theme/colors.dart';
import '../../../../../core/widgets/card_container_with_title.dart';
import '../../../../../core/theme/styles.dart';
import '../../../../../core/widgets/text_with_icon.dart';
import '../../../../../core/localization/app_localizations.dart';
import '../../../doctors/data/models/doctor.dart';
import '../../../../../core/widgets/doctor_card.dart';

class DoctorsContainer extends StatelessWidget {
  final List<Doctor> doctors;
  const DoctorsContainer({
    super.key,
    this.doctors = const [],
  });

  Widget buildLoadedListWidgets() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.zero,
      itemCount: doctors.length,
      itemBuilder: (context, index) {
        return DoctorCard(
          doctors[index],
          width: 225,
          innerPadding:
              const EdgeInsetsDirectional.only(start: 8, end: 0, top: 12),
        );
      },
    );
  }

  Widget buildNoDataWidget(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.person_add_alt_1_rounded,
          size: 80,
          color: context.colorScheme.onSecondary,
        ),
        Center(
          child: Text(
            AppLocalizations.of(context).translate('noDoctorsMessage'),
            textAlign: TextAlign.center,
            style: AppTextStyle.headlineSmall(context).copyWith(
              color: context.colorScheme.onSecondary,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return CardContainerWithTitle(
      title: AppLocalizations.of(context).translate('yourDoctors'),
      isScrollable: doctors.isEmpty ? true : false,
      iconButton: TextWithIcon(
        onTap: () => context.pushRoute(const DoctorsRoute()),
        icon: AppLocalizations.of(context).isEnLocale
            ? Icons.arrow_circle_right_sharp
            : Icons.arrow_circle_left_sharp,
        text: AppLocalizations.of(context).translate('viewAll'),
      ),
      textStyle: AppTextStyle.titleLarge(context).copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      child: doctors.isEmpty
          ? buildNoDataWidget(context)
          : buildLoadedListWidgets(),
    );
  }

  static Widget buildShimmer(BuildContext context) {
    return CardContainerWithTitle.buildShimmer(context);
  }
}
