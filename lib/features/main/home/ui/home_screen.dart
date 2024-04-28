// Flutter Packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/features/main/home/logic/cubit/home_page_cubit.dart';
import 'package:pharmalink/features/main/home/ui/builders/header_builder.dart';
import 'package:pharmalink/features/main/home/ui/builders/reminders_builder.dart';

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

    // Get home page data
    BlocProvider.of<HomePageCubit>(context).getHomePageData();
    // Get reminders list
    BlocProvider.of<HomePageCubit>(context).getReminderList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.secondaryBackground,
      child: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Expanded(
            child: Column(
              children: [
                HeaderBuilder(),
                DoctorsBuilder(),
                RemindersBuilder(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
