import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/icons.dart';
import '../../../../../core/theme/styles.dart';
import '../../../../../core/widgets/card_container.dart';
import '../../../../../core/widgets/loading/loading_indicator.dart';
import '../../data/models/drug_interaction_response.dart';
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
        if (state is DrugInteractionSuccess) {
          var interactionResult = (state).data;
          return showSuccess(context, interactionResult);
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
  Widget getInteractionResult(BuildContext context, List<String> messages) {
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

  bool isThereInteraction(String message) {
    return message == 'No interactions found';
  }

  Widget showSuccess(
      BuildContext context, DrugInteractionResponse interactionResult) {
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
        getInteractionResult(context, interactionResult.messages),
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
                AppLocalizations.of(context).translate('enter2drugs'),
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
