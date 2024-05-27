import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/icons.dart';
import '../../../../../core/theme/styles.dart';
import '../../../../../core/widgets/card_container.dart';
import '../../../../../core/widgets/loading/loading_indicator.dart';
import '../../data/models/drug_interaction_response.dart';
import '../../data/models/interaction.dart';
import '../../logic/cubit/drug_interaction_cubit.dart';
import '../../logic/cubit/drug_interaction_state.dart';
import '../../../../../core/localization/app_localizations.dart';

class InteractionResultContainer extends StatelessWidget {
  const InteractionResultContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrugInteractionCubit, DrugInteractionState>(
      builder: (context, state) {
        if (state is TwoDrugSInteractionSuccess) {
          var interactionResult = (state).data;
          return showSuccessOfDrugAndMedicationsInteraction(
              context, interactionResult);
        }
        if (state is DrugAndMedicationsInteractionSuccess) {
          var interactions = (state).data;
          return showSuccessOfDrugAndMedicationsInteraction(
              context, interactions);
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

  // Get icon status
  Widget getIconStatus(BuildContext context, bool isEmpty) {
    return isEmpty
        ? Icon(
            Icons.info_outline_rounded,
            size: 64,
            color: context.colorScheme.primary,
          )
        : Icon(
            Icons.error_outline_rounded,
            size: 64,
            color: context.colorScheme.error,
          );
  }

  // Get interaction result
  Widget getTwoDrugsInteractionResult(
      BuildContext context, List<String> messages) {
    return ListView.builder(
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
      BuildContext context, List<Interaction> interactions) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Column(
          children: [
            Text(
              interactions[index].drug,
              style: AppTextStyle.headlineMedium(context),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 8.0,
            ),
            ListView.builder(
              itemBuilder: (context, i) {
                return Text(
                  interactions[index].interactionType[i],
                  style: AppTextStyle.bodySmall(context),
                  textAlign: TextAlign.center,
                );
              },
            ),
          ],
        );
      },
      itemCount: interactions.length,
      shrinkWrap: true,
    );
  }

  bool isThereInteraction(dynamic data) {
    if (data is String) {
      return data == 'No interactions found';
    } else if (data is List) {
      return data.isNotEmpty;
    }

    return true;
  }

  Widget showSuccessOfDrugAndMedicationsInteraction(
      BuildContext context, TwoDrugsInteractionResponse interactionResult) {
    // Show success dialog
    return CardContainer(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        getIconStatus(
            context, isThereInteraction(interactionResult.messages[0])),
        const SizedBox(
          height: 16.0,
        ),
        getTwoDrugsInteractionResult(context, interactionResult.messages),
      ],
    );
  }

  Widget showSuccessOfTwoDrugsInteraction(
      BuildContext context, List<Interaction> interactions) {
    // Show success dialog
    return CardContainer(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        getIconStatus(context, isThereInteraction(interactions)),
        const SizedBox(
          height: 16.0,
        ),
        getDrugAndMedicationsInteractionResult(context, interactions),
      ],
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
}
