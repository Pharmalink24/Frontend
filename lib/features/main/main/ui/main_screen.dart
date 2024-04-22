import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../access/signin/logic/cubit/signin_cubit.dart';
import 'widgets/app_bottom_navigation_bar.dart';
import '../../../../core/theme/colors.dart';
import '../data/models/navigation_items.dart';
import 'widgets/refresh_token_bloc_listener.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int activeIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => refreshAccessToken(context));
  }

  Future<void> refreshAccessToken(BuildContext context) async {
    context.read<SigninCubit>().refreshToken();
  }

  @override
  Widget build(BuildContext context) {
    // Refresh token on start
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Column(
          children: [
            RefreshTokenBlocListener(activeIndex: activeIndex),
          ],
        ),
        backgroundColor: AppColors.secondaryBackground,
        bottomNavigationBar: AppBottomNavigationBar(
          currentIndex: activeIndex,
          onTap: (i) {
            setState(() {
              activeIndex = i;
            });
          },
          items: getBottomNavigationBarItems(navigationItems),
        ),
      ),
    );
  }
}
