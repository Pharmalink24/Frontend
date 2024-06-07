import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/features/app/doctors/presentation/logic/doctors_cubit.dart';
import 'package:pharmalink/features/app/home/presentation/widgets/builders/home_header_builder.dart';
import 'package:pharmalink/features/app/home/presentation/widgets/builders/reminders_builder.dart';
import 'package:pharmalink/features/app/profile/presentation/logic/profile_cubit.dart';
import 'package:pharmalink/features/app/reminders/presentation/logic/reminders_cubit.dart';
import '../widgets/builders/doctors_builder.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  void initState() {
    super.initState();

    // Load data
    loadData();
  }

  void _onRefresh() async {
    loadData();
  }

  void loadData() {
    // Get user data
    BlocProvider.of<ProfileCubit>(context).getUserProfile();

    // Get doctors list
    BlocProvider.of<DoctorsCubit>(context).emitDoctorsList();

    // Get reminders list
    BlocProvider.of<RemindersCubit>(context).getRemindersList();
  }

  @override
  Widget build(BuildContext context) {
    // Todo: Add pull to refresh
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            HomeHeaderBuilder(),
            DoctorsBuilder(),
            RemindersBuilder(),
          ],
        ),
      ),
    );
  }
}
