import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmalink/core/helpers/extensions.dart';
import 'package:pharmalink/resources/resources.dart';
import '../../../../../core/localization/app_localizations.dart';
import '../../../../../core/networking/api_constants.dart';
import '../../../../../core/theme/styles.dart';
import '../../../../../core/widgets/card_container_with_title.dart';
import '../../../../../core/models/user.dart';
import '../../../settings/edit_profile/logic/cubit/edit_profile_cubit.dart';
import 'change_image_listener.dart';
import 'dark_mode_switch.dart';

class ProfileInfo extends StatelessWidget {
  final User user;
  const ProfileInfo({
    super.key,
    required this.user,
  });

  Widget _buildProfileImage(BuildContext context) {
    return GestureDetector(
      onTap: () async => context.read<EditProfileCubit>().uploadUserImage(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: SizedBox(
          width: 65,
          height: 65,
          child: user.image != null
              ? Image.network(
                  '${ApiConstants.baseUrl}${user.image}',
                  width: 65,
                  height: 65,
                  fit: BoxFit.cover,
                )
              : SvgPicture.asset(
                  user.gender == 'M'
                      ? Placeholders.malePlaceholder
                      : Placeholders.femalePlaceholder,
                  width: 65,
                  height: 65,
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }

  Widget _buildUserInfo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          _buildProfileImage(context),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${user.fname} ${user.lname}".crop(14),
                style: AppTextStyle.headlineSmall(context),
              ),
              Text(
                user.email!.crop(30),
                style: AppTextStyle.bodySmall(context).copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Text(
                '@${(user.username ?? '').crop(28)}',
                style: AppTextStyle.bodySmall(context).copyWith(
                  color: Theme.of(context).colorScheme.onSecondary,
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CardContainerWithTitle(
      title: AppLocalizations.of(context).translate('profile'),
      textStyle: AppTextStyle.displaySmall(context),
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
      margin: const EdgeInsets.all(0.0),
      isScrollable: false,
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: _buildUserInfo(context),
          ),
          Divider(
            color: Theme.of(context).colorScheme.background,
          ),
          const Expanded(
            flex: 2,
            child: DarkModeSwitch(),
          ),
          ChangeImageListener(),
        ],
      ),
    );
  }
}
