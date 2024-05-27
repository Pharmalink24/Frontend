// Flutter Packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/features/main/doctors/logic/cubit/doctors_cubit.dart';
import 'package:pharmalink/features/main/home/ui/builders/header_builder.dart';
import 'package:pharmalink/features/main/home/ui/builders/reminders_builder.dart';
import 'package:pharmalink/features/main/profile/logic/profile_cubit/profile_cubit.dart';
import 'package:pharmalink/features/main/reminders/logic/reminders_cubit.dart';

import 'builders/doctors_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    // Get user data
    BlocProvider.of<ProfileCubit>(context).getUserProfile();

    // Get doctors list
    BlocProvider.of<DoctorsCubit>(context).emitDoctorsList();

    // Get reminders list
    BlocProvider.of<RemindersCubit>(context).getRemindersList();
  
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            HeaderBuilder(),
            DoctorsBuilder(),
            RemindersBuilder(),
          ],
        ),
      ),
    );
  }
}
