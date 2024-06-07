import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/fonts.dart';
import 'package:pharmalink/features/main/drug_interaction/logic/cubit/drug_interaction_cubit.dart';
import 'package:pharmalink/features/main/drug_interaction/ui/widgets/drug_interaction_with_medications.dart';

import '../../../../../core/localization/app_localizations.dart';
import '../../../../../core/theme/styles.dart';
import '../../../../../shared/presentation/widgets/card_container_with_title.dart';
import 'drug_interaction_between_two_drugs.dart';

class DrugInteractionInputsTab extends StatefulWidget {
  const DrugInteractionInputsTab({super.key});

  @override
  State<DrugInteractionInputsTab> createState() =>
      _DrugInteractionInputsTabState();
}

class _DrugInteractionInputsTabState extends State<DrugInteractionInputsTab>
    with TickerProviderStateMixin {
  TabController? tabBarController;

  @override
  void initState() {
    super.initState();

    // Initialize the TabController
    tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    );
  }

  // Build the TabBar
  TabBar _buildTabBar() {
    return TabBar(
      controller: tabBarController,
      tabs: [
        Tab(
          text: AppLocalizations.of(context).translate('With your Medications'),
        ),
        Tab(
          text: AppLocalizations.of(context).translate('Between Two Drugs'),
        ),
      ],
      isScrollable: true,
      labelColor: context.colorScheme.onPrimary,
      unselectedLabelColor: context.colorScheme.onSecondary,
      tabAlignment: TabAlignment.start,
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      indicatorSize: TabBarIndicatorSize.label,
      enableFeedback: false,
      labelPadding: const EdgeInsetsDirectional.fromSTEB(6, 0, 8, 0),
      labelStyle: AppTextStyle.displaySmall(context).copyWith(
        color: context.colorScheme.onPrimary,
        fontFamily: AppFonts.getFont(context, Font.tertiary),
        fontSize: 14.0,
      ),
      unselectedLabelStyle: AppTextStyle.displaySmall(context).copyWith(
        color: context.colorScheme.onSecondary,
        fontFamily: AppFonts.getFont(context, Font.tertiary),
        fontSize: 14.0,
      ),
      indicatorColor: context.colorScheme.primary,
      indicatorWeight: 1,
      onTap: (i) async {
        [() async {}, () async {}][i]();
        context.read<DrugInteractionCubit>().selectTab(i);
      },
    );
  }

  // Build the TabBarView
  TabBarView _buildTabBody() {
    return TabBarView(
      controller: tabBarController,
      children: const [
        DrugInteractionWithMedications(),
        DrugInteractionBetweenTwoDrugs(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return CardContainerWithTitle(
      title: AppLocalizations.of(context).translate('drugInteractionTitle'),
      // textStyle: AppTextStyle.displayMedium(context).copyWith(fontSize: 28),
      isScrollable: false,
      child: Column(
        children: [
          _buildTabBar(),
          Expanded(
            child: _buildTabBody(),
          ),
        ],
      ),
    );
  }
}
