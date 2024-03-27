// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/styles.dart';

class DrugInteractionScreen extends StatefulWidget {
  const DrugInteractionScreen({super.key});

  @override
  State<DrugInteractionScreen> createState() => _DrugInteractionScreenState();
}

class _DrugInteractionScreenState extends State<DrugInteractionScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.secondaryBackground,
      height: double.infinity,
      width: double.infinity,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 32, 16, 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Interactions',
                textAlign: TextAlign.center,
                style: AppTextStyle.displayMedium.copyWith(
                  fontSize: 45,
                ),
              ),
              const Divider(
                thickness: 1,
                color: Color(0x00FFFFFF),
              ),
              Text(
                'First Drug',
                textAlign: TextAlign.start,
                style: AppTextStyle.bodyMedium.copyWith(
                  fontFamily: 'Readex Pro',
                  fontSize: 24,
                ),
              ),
              const Divider(
                thickness: 1,
                color: Color(0x00FFFFFF),
              ),
              DropdownMenu(
                width: 300,
                hintText: 'Please select...',
                enableFilter: true,
                leadingIcon: Icon(
                  Icons.format_list_bulleted,
                  color: AppColors.secondaryText,
                  size: 24,
                ),
                dropdownMenuEntries: <String>[
                  'Tesla Model S',
                  'Hyundai Sonata',
                  'Jeep Wrangler',
                  'Honda Accord',
                  'Mercedes S-Class'
                ].map<DropdownMenuEntry<String>>((String value) {
                  return DropdownMenuEntry<String>(
                    value: value,
                    label: value,
                    
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
