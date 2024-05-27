import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';
import 'package:pharmalink/core/networking/api_constants.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/gradient.dart';
import '../../../../../core/theme/styles.dart';
import '../../../../../core/localization/app_localizations.dart';
import '../../../../../core/widgets/loading/loading_indicator.dart';
import '../../../../../resources/resources.dart';

const kFontSize = 22.0;

class WelcomeNameText extends StatelessWidget {
  final String fname;
  final String lname;
  final String? image;
  final String gender;

  const WelcomeNameText({
    super.key,
    this.fname = "",
    this.lname = "",
    this.gender = "M",
    this.image,
  });

  // Build the hello text
  Widget _buildHello(BuildContext context) {
    return Text(
      AppLocalizations.of(context).translate('hello'),
      style: AppTextStyle.bodyMedium(context).copyWith(
        fontSize: kFontSize,
      ),
    );
  }

  // Build the name text
  Widget _buildName(BuildContext context) {
    return AnimatedTextKit(
      repeatForever: true,
      animatedTexts: [
        ColorizeAnimatedText(
          fname,
          textStyle: AppTextStyle.bodyMedium(context).copyWith(
            color: context.colorScheme.primary,
            fontSize: kFontSize,
            fontWeight: FontWeight.w600,
          ),
          colors: AppGradients.primaryColors(context),
          textAlign: TextAlign.start,
          textDirection: TextDirection.ltr,
          speed: const Duration(milliseconds: 1000),
        ),
        ColorizeAnimatedText(
          lname,
          textStyle: AppTextStyle.bodyMedium(context).copyWith(
            color: context.colorScheme.primary,
            fontSize: kFontSize,
            fontWeight: FontWeight.w600,
          ),
          colors: AppGradients.primaryColors(context),
          textAlign: TextAlign.start,
          textDirection: TextDirection.ltr,
          speed: const Duration(milliseconds: 1000),
        ),
      ],
      isRepeatingAnimation: true,
    );
  }

  // Build the image
  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: SizedBox(
        width: 45,
        height: 45,
        child: CachedNetworkImage(
          width: 45,
          height: 45,
          fit: BoxFit.cover,
          imageUrl: '${ApiConstants.httpsDomain}$image',
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
            gender == 'F'
                ? Placeholders.femalePlaceholder
                : Placeholders.malePlaceholder,
            width: 45,
            height: 45,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildImage(),
            const SizedBox(width: 10),
            _buildHello(context),
            _buildName(context),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.notifications,
            color: context.colorScheme.secondary,
          ),
        ),
      ],
    );
  }
}
