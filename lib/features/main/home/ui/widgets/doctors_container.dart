import 'package:flutter/material.dart';
import '../../../../../core/theme/colors.dart'; // Todo: Remove this line
import '../../../../../core/widgets/card_container_with_title.dart';
import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/theme/styles.dart';
import '../../../../../core/widgets/text_with_icon.dart';
import '../../../../../core/localization/app_localizations.dart';
import '../../../../../core/models/doctor.dart';
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
        );
      },
    );
  }

  Widget buildNoDataWidget(BuildContext context) {
    return Column(
      children: [
        const Icon(
          Icons.person_add_alt_1_rounded,
          size: 80,
          color: AppColors.accent5,
        ),
        Center(
          child: Text(
            AppLocalizations.of(context).translate('noDoctorsMessage'),
            textAlign: TextAlign.center,
            style: AppTextStyle.headlineSmall(context).copyWith(
          color: Theme.of(context).colorScheme.onSecondary,
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
      isScrollable: doctors.isEmpty? true:false,
      iconButton: TextWithIcon(
        onTap: () => context.pushNamed(Routes.doctorsScreen),
        icon: AppLocalizations.of(context).isEnLocale
            ? Icons.arrow_circle_right_sharp
            : Icons.arrow_circle_left_sharp,
        text: AppLocalizations.of(context).translate('viewAll'),
      ),
      child: doctors.isEmpty
          ? buildNoDataWidget(context)
          : buildLoadedListWidgets(),
    );
  }
}
