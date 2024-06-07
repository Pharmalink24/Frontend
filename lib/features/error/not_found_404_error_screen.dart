import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/styles.dart';
import 'package:pharmalink/resources/resources.dart';
import 'package:pharmalink/shared/presentation/widgets/form/form_button.dart';

@RoutePage()    
class NotFound404ErrorScreen extends StatelessWidget {
  const NotFound404ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            Backgrounds.brokenLink,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Positioned(
            bottom: 230,
            left: 30,
            child: Text(
              'Dead End',
              style: AppTextStyle.titleMedium(context).copyWith(
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            bottom: 170,
            left: 30,
            child: Text(
              'Oops! The page you are looking for\nis not found',
              style: AppTextStyle.titleSmall(context).copyWith(
                color: Colors.white54,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          Positioned(
            bottom: 100,
            left: 30,
            right: 250,
            child: FormButton(
              text: 'Home',
              color: Colors.white,
              textColor: Colors.black,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}