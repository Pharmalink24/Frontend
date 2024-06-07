import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/icons.dart';
import '../../../../../core/theme/styles.dart';
import '../../../../../shared/presentation/widgets/card_container.dart';
import '../../../../../shared/presentation/widgets/card_container_list.dart';
import '../../../../../shared/presentation/widgets/expansion_card_container.dart';
import '../../../../../shared/presentation/widgets/loading/loading_indicator.dart';
import '../../data/models/drug_interaction_response.dart';
import '../../data/models/interaction.dart';
import '../../logic/cubit/drug_interaction_cubit.dart';
import '../../logic/cubit/drug_interaction_state.dart';
import '../../../../../core/localization/app_localizations.dart';

class InteractionResultContainer extends StatelessWidget {
  const InteractionResultContainer({
    super.key,
  });

  // Get icon status
  Widget _buildNoInteractionWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.info_outline_rounded,
          size: 64,
          color: context.colorScheme.primary,
        ),
        const SizedBox(height: 16.0),
        Text(
          'No interactions found',
          style: AppTextStyle.headlineMedium(context),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  bool isThereInteraction(List interactions) =>
      interactions.isEmpty || interactions[0] == 'No interactions found';

  // Get interaction result
  Widget getTwoDrugsInteractionResult(
      BuildContext context, List<String> messages) {
    return isThereInteraction(messages)
        ? _buildNoInteractionWidget(context)
        : ListView.builder(
            itemBuilder: (context, index) {
              return Text(
                messages[index],
                style: AppTextStyle.headlineMedium(context),
                textAlign: TextAlign.center,
              );
            },
            itemCount: messages.length,
            shrinkWrap: true,
          );
  }

  // Get interaction result
  Widget getDrugAndMedicationsInteractionResult(
    BuildContext context,
    List<Interaction> interactions,
  ) {
    return isThereInteraction(interactions)
        ? _buildNoInteractionWidget(context)
        : ListView.builder(
            itemBuilder: (context, index) {
              return ExpansionCardContainer(
                title: interactions[index].drug,
                subTitle: "With ${interactions[index].prescriptionDrug}",
                children:
                    interactions[index].interactionType.map((interactionType) {
                  return Text(
                    interactionType,
                    style: AppTextStyle.bodyMedium(context).copyWith(
                      color: context.colorScheme.error,
                    ),
                    textAlign: TextAlign.center,
                  );
                }).toList(),
              );
            },
            itemCount: interactions.length,
            shrinkWrap: true,
          );
  }

  Widget showSuccess(
    BuildContext context,
    Widget child,
  ) {
    // Show success dialog
    return CardContainerList(
      child: child,
    );
  }

  Widget showError(BuildContext context, String error) {
    // Show success dialog
    return CardContainer(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.error_outline_sharp,
          size: 40,
          color: context.colorScheme.error,
        ),
        Text(
          error,
          style: AppLocalizations.of(context).isEnLocale
              ? AppTextStyle.displaySmall(context)
              : AppTextStyle.headlineLarge(context),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget defaultWidget(BuildContext context) {
    // Show success dialog
    return CardContainer(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              FFIcons.kLogoPharmaLink,
              size: 64,
              color: context.colorScheme.onSecondary,
            ),
            const SizedBox(height: 16.0),
            Center(
              child: Text(
                AppLocalizations.of(context).translate('enterDrugs'),
                textAlign: TextAlign.center,
                style: AppTextStyle.headlineSmall(context).copyWith(
                  color: context.colorScheme.onSecondary,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget loadingWidget() {
    return const CardContainer(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        LoadingIndicator(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrugInteractionCubit, DrugInteractionState>(
      builder: (context, state) {
        if (state is TwoDrugSInteractionSuccess) {
          var interactionResult = (state).data as TwoDrugsInteractionResponse;
          return showSuccess(
            context,
            getTwoDrugsInteractionResult(
              context,
              interactionResult.messages,
            ),
          );
        }
        if (state is DrugAndMedicationsInteractionSuccess) {
          var interactions = (state).data;
          return showSuccess(
            context,
            getDrugAndMedicationsInteractionResult(
              context,
              interactions,
            ),
          );
        } else if (state is Error) {
          return showError(context, (state).error);
        } else if (state is Loading) {
          return loadingWidget();
        } else {
          return defaultWidget(context);
        }
      },
    );
  }
}
