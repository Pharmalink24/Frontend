import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/models/doctor.dart';
import '../../../../../core/widgets/app_shimmer.dart';
import '../../../../../core/widgets/error_card.dart';
import '../../../doctors/logic/cubit/doctors_cubit.dart';
import '../../../doctors/logic/cubit/doctors_state.dart';
import '../widgets/doctors_container.dart';

const kFlex = 4;

class DoctorsBuilder extends StatelessWidget {
  const DoctorsBuilder({super.key});

  // Success widget
  Widget buildSuccessWidget(List<Doctor> doctors) {
    return Expanded(
      flex: kFlex,
      child: DoctorsContainer(doctors: doctors),
    );
  }

  // Loading widget
  Widget buildLoadingWidget() {
    return const Expanded(
      flex: kFlex,
      child: AppShimmer(
        child: DoctorsContainer(),
      ),
    );
  }

  // Error widget
  Widget buildErrorWidget(BuildContext context, String error) {
    return ErrorCard(
      message: error,
      onRetry: () {
        BlocProvider.of<DoctorsCubit>(context).emitDoctorsList();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorsCubit, DoctorsState>(
      buildWhen: (previous, current) =>
          current is Loading ||
          current is Success ||
          current is Error,
      builder: (context, state) {
        if (state is Success) {
          var doctors = state.data;
          return buildSuccessWidget(doctors);
        } else if (state is Loading) {
          return buildLoadingWidget();
        } else if (state is Error) {
          var error = (state).error;
          return buildErrorWidget(context, error);
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
