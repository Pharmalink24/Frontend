import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:pharmalink/core/theme/styles.dart';
import 'package:pharmalink/core/widgets/loading_indicator.dart';

import '../../../../../core/models/drug_search.dart';
import '../../logic/cubit/drug_interaction_cubit.dart';

class DrugSearchField extends StatefulWidget {
  final int drugFieldId;
  final TextEditingController? controller;
  const DrugSearchField(
      {super.key, required this.drugFieldId, this.controller});

  @override
  State<DrugSearchField> createState() => _DrugSearchFieldState();
}

class _DrugSearchFieldState extends State<DrugSearchField> {
  @override
  Widget build(BuildContext context) {
    return TypeAheadField<DrugSearch>(
      hideWithKeyboard: false,
      controller: widget.controller,
      suggestionsCallback: (search) async =>
          await getSearchedDrugs(drugId: widget.drugFieldId, search: search),
      itemBuilder: (context, drug) {
        return drugListTile(drug);
      },
      builder: (context, controller, focusNode) {
        return TextField(
          controller: controller,
          focusNode: focusNode,
          decoration: AppTextFieldDecoration.searchInputDecoration.copyWith(
            labelText: "Please Select...",
          ),
        );
      },
      onSelected: (drug) {
        selectDrug(widget.controller, drug);
      },
      loadingBuilder: (context) => const LoadingIndicator(),
      errorBuilder: (context, error) => const Text('Error!'),
      emptyBuilder: (context) => noDrugFoundWidget(),
    );
  }

  Widget drugListTile(DrugSearch drug) {
    return ListTile(
      title: Text(drug.tradeName),
      subtitle: Text('${drug.quantity} ${drug.unit}'),
    );
  }

  Widget noDrugFoundWidget() {
    return const ListTile(
        title: Text(
      'No Items Found',
    ));
  }

  Future<List<DrugSearch>?> getSearchedDrugs(
      {required int drugId, required String search}) async {
    if (search.length > 2) {
      return await context
          .read<DrugInteractionCubit>()
          .getDrugSearchSuggestion(drugId: drugId);
    }
    return null;
  }

  void selectDrug(TextEditingController? controller, DrugSearch drug) {
    controller?.text = drug.tradeName;
    context
        .read<DrugInteractionCubit>()
        .setActiveIngredients(drug, widget.drugFieldId);
  }
}
