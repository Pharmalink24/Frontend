// Flutter Packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/styles.dart';
import 'package:pharmalink/features/main/home/data/models/home_page_response.dart';
import 'package:pharmalink/features/main/home/logic/cubit/home_page_cubit.dart';
import 'package:pharmalink/features/main/home/logic/cubit/home_page_state.dart';
import 'package:pharmalink/features/main/home/ui/widgets/doctors_container.dart';
import 'package:pharmalink/core/widgets/loading_indicator.dart';
import 'widgets/reminders_container.dart';
import 'widgets/welcome_name_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomePageCubit>(context).getHomePageData();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<HomePageCubit, HomePageState>(
      builder: (context, state) {
        if (state is success) {
          var homePageData = state.data;
          return buildLoadedListWidgets(homePageData);
        } else if (state is Loading) {
          return const LoadingIndicator();
        } else {
          var error = (state as Error).error;
          return showError(error);
        }
      },
    );
  }

  Widget buildLoadedListWidgets(HomePageResponse homePageData) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WelcomeNameText(name: homePageData.firstName),
          DoctorsContainer(doctors: homePageData.doctors),
          RemindersContainer(drugs: homePageData.drugs),
        ],
      ),
    );
  }

  Widget showError(String error) {
    return Center(
      child: Text(
        error,
        style: AppTextStyle.headlineMedium,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.secondaryBackground,
      height: double.infinity,
      child: SafeArea(
        child: buildBlocWidget(),
      ),
    );
  }
}
