import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmalink/core/helpers/extensions.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/widgets/loading/loading_indicator.dart';
import 'package:pharmalink/resources/resources.dart';
import '../../../../../core/localization/app_localizations.dart';
import '../../../../../core/networking/api/api_constants.dart';
import '../../../../../core/theme/styles.dart';
import '../../../../../core/widgets/card_container_with_title.dart';
import '../../../../../core/models/user.dart';
import '../../../settings/edit_profile/logic/cubit/edit_profile_cubit.dart';
import 'change_image_listener.dart';
import 'dark_mode_switch.dart';

class ProfileInfo extends StatelessWidget {
  final User? user;
  const ProfileInfo({
    super.key,
    this.user,
  });

  Widget _buildProfileImage(BuildContext context) {
    return GestureDetector(
      onTap: () async => context.read<EditProfileCubit>().uploadUserImage(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: SizedBox(
          width: 65,
          height: 65,
          child: CachedNetworkImage(
            width: 65,
            height: 65,
            fit: BoxFit.cover,
            imageUrl: '${ApiConstants.httpsDomain}${user?.image}',
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                LoadingIndicator(loadingProgress: downloadProgress),
            errorWidget: (context, url, error) => SvgPicture.asset(
              // Todo: Replace all placeholders by const widgets
              user?.gender == 'F'
                  ? Placeholders.femalePlaceholder
                  : Placeholders.malePlaceholder,
              width: 65,
              height: 65,
              fit: BoxFit.cover,
            ),
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
                user != null ? "${user?.fname} ${user?.lname}".crop(14) : '',
                style: AppTextStyle.headlineSmall(context),
              ),
              Text(
                user != null ? user!.email!.crop(30) : '',
                style: AppTextStyle.bodySmall(context).copyWith(
                  color: context.colorScheme.primary,
                ),
              ),
              Text(
                user != null ? '@${(user?.username ?? '').crop(28)}' : '@',
                style: AppTextStyle.bodySmall(context).copyWith(
                  color: context.colorScheme.onSecondary,
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
            color: context.colorScheme.surface,
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
