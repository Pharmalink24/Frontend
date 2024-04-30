import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:pharmalink/core/theme/styles.dart';
import 'package:pharmalink/core/widgets/loading_indicator.dart';
import 'package:pharmalink/features/main/drug_interaction/logic/cubit/drug_interaction_cubit.dart';
import '../../../../../core/models/drug_search.dart';
import 'package:pharmalink/core/localization/app_localizations.dart';

class DrugSearchField extends StatelessWidget {
  final int drugFieldId;
  final TextEditingController? controller;
  const DrugSearchField(
      {super.key, required this.drugFieldId, this.controller});

  @override
  Widget build(BuildContext context) {
    return TypeAheadField<DrugSearch>(
      hideWithKeyboard: false,
      controller: controller,
      suggestionsCallback: (search) async =>
          await getSearchedDrugs(context, drugId: drugFieldId, search: search),
      itemBuilder: (context, drug) {
        return drugListTile(drug);
      },
      builder: (context, controller, focusNode) {
        return TextField(
          controller: controller,
          focusNode: focusNode,
          decoration:
              AppTextFieldDecoration.searchInputDecoration(context).copyWith(
            labelText:
                AppLocalizations.of(context).translate('pleaseSelectDrugs'),
          ),
        );
      },
      onSelected: (drug) {
        selectDrug(context, controller, drug);
      },
      loadingBuilder: (context) => const LoadingIndicator(),
      errorBuilder: (context, error) => const Text('Error!'),
      emptyBuilder: (context) => noDrugFoundWidget(context),
    );
  }

  Widget drugListTile(DrugSearch drug) {
    return ListTile(
      title: Text(drug.tradeName),
      subtitle: Text('${drug.quantity} ${drug.unit}'),
    );
  }

  Widget noDrugFoundWidget(BuildContext context) {
    return ListTile(
        title: Text(
      AppLocalizations.of(context).translate('noInteractions'),
    ));
  }

  Future<List<DrugSearch>?> getSearchedDrugs(BuildContext context,
      {required int drugId, required String search}) async {
    if (search.length > 2) {
      return await context
          .read<DrugInteractionCubit>()
          .getDrugSearchSuggestion(drugId: drugId);
    }
    return null;
  }

  void selectDrug(
      BuildContext context, TextEditingController? controller, DrugSearch drug) {
    controller?.text = drug.tradeName;
    context
        .read<DrugInteractionCubit>()
        .setActiveIngredients(drug, drugFieldId);
  }
}
