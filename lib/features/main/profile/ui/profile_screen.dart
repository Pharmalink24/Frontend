// Flutter Packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/styles.dart';
import '../data/models/user.dart';
import '../logic/cubit/profile_cubit.dart';
import '../logic/cubit/profile_state.dart';
import 'widgets/account_settings.dart';
import 'widgets/profile_info.dart';
import 'package:pharmalink/core/widgets/loading_indicator.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();

    // Get user profile
    context.read<ProfileCubit>().getUserProfile();
  }

  Widget buildProfileScreen(User user) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileInfo(user: user),
            const AccountSettings(),
          ],
        ),
      ),
    );
  }

  Widget buildErrorWidget(String error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error,
              size: 50,
              color: AppColors.error,
            ),
            const SizedBox(height: 20),
            Text(
              error,
              style: AppTextStyle.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<ProfileCubit>().getUserProfile();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondary,
              ),
              child: Text(
                'Retry',
                style: AppTextStyle.bodySmall.copyWith(
                  color: AppColors.accent5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is Loading) {
          return const LoadingIndicator();
        } else if (state is Success) {
          final user = state.data;
          return buildProfileScreen(user);
        } else if (state is Error) {
          return buildErrorWidget(state.error);
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
