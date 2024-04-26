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

    // Get home page data
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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Expanded(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: WelcomeNameText(name: homePageData.firstName),
            ),
            Expanded(
              flex: 4,
              child: DoctorsContainer(doctors: homePageData.doctors),
            ),
            Expanded(
              flex: 6,
              child: RemindersContainer(drugs: homePageData.drugs),
            ),
          ],
        ),
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
      child: SafeArea(
        child: buildBlocWidget(),
      ),
    );
  }
}
