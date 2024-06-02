import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/features/main/doctors/logic/cubit/doctors_cubit.dart';
import 'package:pharmalink/features/main/home/ui/builders/home_header_builder.dart';
import 'package:pharmalink/features/main/home/ui/builders/reminders_builder.dart';
import 'package:pharmalink/features/main/profile/logic/profile_cubit/profile_cubit.dart';
import 'package:pharmalink/features/main/reminders/logic/reminders_cubit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'builders/doctors_builder.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();

    // Load data
    loadData();
  }

  void _onRefresh() async {
    loadData();

    _refreshController.refreshCompleted();
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
