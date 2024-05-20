// Flutter Packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/localization/app_localizations.dart';
import 'package:pharmalink/core/theme/styles.dart';
import '../../../../core/models/user.dart';
import '../logic/cubit/profile_cubit.dart';
import '../logic/cubit/profile_state.dart';
import 'widgets/account_settings.dart';
import 'widgets/profile_info.dart';
import 'package:pharmalink/core/widgets/loading/loading_indicator.dart';

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 11,
            child: ProfileInfo(user: user),
          ),
          const Expanded(
            flex: 20,
            child: AccountSettings(),
          ),
        ],
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
            Icon(
              Icons.error,
              size: 50,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 20),
            Text(
              error,
              style: AppTextStyle.bodyMedium(context),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<ProfileCubit>().getUserProfile();
              },
              child: Text(
                AppLocalizations.of(context).translate('retry'),
                style: AppTextStyle.bodySmall(context),
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
        if (state is ProfileInformationLoading) {
          return const LoadingIndicator();
        } else if (state is ProfileInformationSuccess) {
          final user = state.data;
          return buildProfileScreen(user);
        } else if (state is ProfileInformationError) {
          return buildErrorWidget(state.error);
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
