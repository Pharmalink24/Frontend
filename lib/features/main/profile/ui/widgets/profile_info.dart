import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/helpers/constants/paths.dart';
import '../../../../../core/localization/app_localizations.dart';
import '../../../../../core/networking/api_constants.dart';
import '../../../../../core/theme/styles.dart';
import '../../../../../core/widgets/card_container_with_title.dart';
import '../../../../../core/models/user.dart';
import 'dark_mode_switch.dart';

class ProfileInfo extends StatefulWidget {
  final User user;
  const ProfileInfo({
    super.key,
    required this.user,
  });

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  String cropperName(String name, {int length = 5}) {
    return name.length > length ? '${name.substring(0, length - 1)}..' : name;
  }

  Widget _buildUserInfo() {
    Image image = Image.network(
      '${ApiConstants.baseUrl}${widget.user.image}',
    );

    SvgPicture placeholder = SvgPicture.asset(
      widget.user.gender == 'M'
          ? '${AppPaths.placeholder}/male_placeholder.svg'
          : '${AppPaths.placeholder}/female_placeholder.svg',
      width: 65,
      height: 65,
      fit: BoxFit.cover,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          widget.user.image != null ? image : placeholder,
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cropperName("${widget.user.fname} ${widget.user.lname}",
                    length: 14),
                style: AppTextStyle.headlineSmall(context),
              ),
              Text(
                cropperName(widget.user.email!, length: 30),
                style: AppTextStyle.bodySmall(context).copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Text(
                '@${cropperName(widget.user.username ?? '', length: 28)}',
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
            child: _buildUserInfo(),
          ),
          Divider(
            color: Theme.of(context).colorScheme.background,
          ),
          const Expanded(
            flex: 2,
            child: DarkModeSwitch(),
          ),
        ],
      ),
    );
  }
}
