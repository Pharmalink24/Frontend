import 'package:flutter/material.dart';
import 'package:pharmalink/core/helpers/extensions.dart';
import 'package:pharmalink/core/routes/routes.dart';
import 'package:pharmalink/core/theme/styles.dart';
import 'package:pharmalink/core/widgets/text_with_icon.dart';
import '../../../../../core/widgets/card_container.dart';
import '../../data/models/doctor.dart';
import 'doctor_container.dart';

class DoctorsContainer extends StatelessWidget {
  final List<Doctor> doctors;
  const DoctorsContainer({
    super.key,
    required this.doctors,
  });

    Widget buildLoadedListWidgets() {
      return ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          return DoctorContainer(
            firstName: doctors[index].username,
            lastName: doctors[index].username,
            specialty: doctors[index].username,
            url: doctors[index].image,
          );
        },
      );
    }

    Widget buildNoDataWidget() {
      return const Center(
        child: Text(
          'Here will be your doctors list.',
          style: AppTextStyle.bodyLarge,
        ),
      );
    }


  @override
  Widget build(BuildContext context) {
    return CardContainer(
      title: "Your Doctors",
      iconButton: TextWithIcon(
        onTap: () => context.pushNamed(Routes.doctorsScreen),
        icon: Icons.arrow_circle_right_sharp,
        text: 'View All',
      ),
      child: doctors.isEmpty ? buildLoadedListWidgets() : buildNoDataWidget(),
    );
  }
}
