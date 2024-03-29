import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:pharmalink/features/main/drug_interaction/data/models/drug.dart';
import 'package:pharmalink/features/main/drug_interaction/data/models/drug_eye_search_request_params.dart';
import 'package:pharmalink/features/main/drug_interaction/data/repo/drug_interaction_repo.dart';
import '../../../../../core/helpers/errors.dart';
import 'drug_interaction_state.dart';

class DrugInteractionCubit extends Cubit<DrugInteractionState> {
  final DrugInteractionRepo _drugInteractionRepo;
  List<Drug>? drugs;

  DrugInteractionCubit(this._drugInteractionRepo)
      : super(const DrugInteractionState.initial());

  TextEditingController drugController1 = TextEditingController();
  TextEditingController drugController2 = TextEditingController();
  final formKey = GlobalKey<FormState>();

  List<Drug>? getDrugSearchSuggestion({required int drugId}) {
    _drugInteractionRepo
        .searchDrugFromDrugEye(
          DrugEyeSearchRequestParams(
            query: drugId == 1 ? drugController1.text : drugController2.text,
          ),
        )
        .then(
          (response) => response.when(
            success: (drugs) {
              emit(DrugInteractionState.drugInteractionRetrieved(drugs));
              this.drugs = drugs;
            },
            failure: (error) {
              emit(
                DrugInteractionState.error(
                  error: error.apiErrorModel.message ?? ERR.UNEXPECTED,
                ),
              );
              drugs = null;
            },
          ),
        );

    return drugs;
  }

  void emitDrugInteractionStates() async {
    emit(const DrugInteractionState.loading());

    // final response = await _drugInteractionRepo;

    // response.when(success: (drugEyeSearchResponse) {
    //   emit(DrugInteractionState.searchedDrugsRetrieved(drugEyeSearchResponse));
    // }, failure: (error) {
    //   emit(
    //     DrugInteractionState.error(
    //         error: error.apiErrorModel.message ?? ERR.UNEXPECTED),
    //   );
    // });
  }
}
