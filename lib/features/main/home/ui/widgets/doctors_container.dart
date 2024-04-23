import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/widgets/card_container_with_title.dart';
import 'package:pharmalink/core/helpers/extensions.dart';
import 'package:pharmalink/core/routes/routes.dart';
import 'package:pharmalink/core/theme/styles.dart';
import 'package:pharmalink/core/widgets/text_with_icon.dart';
import '../../../../../core/models/doctor.dart';
import '../../../../../core/widgets/doctor_card.dart';

class DoctorsContainer extends StatelessWidget {
  final List<Doctor> doctors;
  const DoctorsContainer({
    super.key,
    required this.doctors,
  });

  Widget buildLoadedListWidgets() {
    return Expanded(
      child: SizedBox(
        height: 125,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.zero,
          itemCount: doctors.length,
          itemBuilder: (context, index) {
            return DoctorCard(doctors[index]);
          },
        ),
      ),
    );
  }

  Widget buildNoDataWidget() {
    return Column(
      children: [
        const Icon(
          Icons.person_add_alt_1_rounded,
          size: 80,
          color: AppColors.accent5,
        ),
        Center(
          child: Text(
            'Your doctors list is empty.',
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
      title: "Your Doctors",
      iconButton: TextWithIcon(
        onTap: () => context.pushNamed(Routes.doctorsScreen),
        icon: Icons.arrow_circle_right_sharp,
        text: 'View All',
      ),
      child: doctors.isEmpty ? buildNoDataWidget() : buildLoadedListWidgets(),
    );
  }
}
