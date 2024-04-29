import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/widgets/card_container_with_title.dart';
import 'package:pharmalink/core/helpers/extensions.dart';
import 'package:pharmalink/core/routes/routes.dart';
import 'package:pharmalink/core/theme/styles.dart';
import 'package:pharmalink/core/widgets/text_with_icon.dart';
import 'package:pharmalink/generated/l10n.dart';
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
            S.of(context).noDoctorsMessage,
            style: AppTextStyle.headlineSmall.copyWith(
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return CardContainerWithTitle(
      title: S.of(context).yourDoctors,
      iconButton: TextWithIcon(
        onTap: () => context.pushNamed(Routes.doctorsScreen),
        icon: Icons.arrow_circle_right_sharp,
        text: S.of(context).viewAll,
      ),
      child: doctors.isEmpty ? buildNoDataWidget(context) : buildLoadedListWidgets(),
    );
  }
}
