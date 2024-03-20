import '../../utilities/constants/constants.dart';
import 'package:flutter/material.dart';

class PrescriptionCategoryWidget extends StatelessWidget {
  PrescriptionCategoryWidget({
    super.key,
    required this.titleText,
    required this.descriptionText,
    required this.backgroundColor,
    required this.followingScreen,
  });

  final String titleText;
  final String descriptionText;
  final Color backgroundColor;
  final Widget followingScreen;

  /// this function checks that color difference between background color and
  /// text color and returns different color for text
  Color checkFontColor(Color backgroundColor) {
    return (backgroundColor == AppColors.secondary)
        ? AppColors.alternate
        : AppColors.primaryText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => followingScreen),
          );
        },
        child: Card(
          color: backgroundColor,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Align(
                alignment: AlignmentDirectional(-1, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                  child: Text(
                    titleText,
                    style: AppTextStyle.displayMedium.copyWith(
                        fontSize: 45, color: checkFontColor(backgroundColor)),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 20),
                  child: Text(
                    descriptionText,
                    style: AppTextStyle.displayMedium.copyWith(
                        fontSize: 20, color: checkFontColor(backgroundColor)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
