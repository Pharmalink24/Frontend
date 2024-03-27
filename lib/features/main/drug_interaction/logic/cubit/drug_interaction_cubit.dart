import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:pharmalink/features/main/drug_interaction/data/models/drug_eye_search_request_params.dart';
import 'package:pharmalink/features/main/drug_interaction/data/repo/drug_interaction_repo.dart';
import '../../../../../core/helpers/errors.dart';
import 'drug_interaction_state.dart';

class DrugInteractionCubit extends Cubit<DrugInteractionState> {
  final DrugInteractionRepo _drugInteractionRepo;

  DrugInteractionCubit(this._drugInteractionRepo)
      : super(const DrugInteractionState.initial());

  TextEditingController drug1Controller = TextEditingController();
  TextEditingController drug2Controller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitDrugEyeSearchStates({required int drugId}) async {
    emit(const DrugInteractionState.loading());

    final response = await _drugInteractionRepo.searchDrugFromDrugEye(
      DrugEyeSearchRequestParams(
        query: drugId == 1 ? drug1Controller.text : drug2Controller.text,
      ),
    );

    response.when(success: (drugEyeSearchResponse) {
      emit(DrugInteractionState.searchedDrugsRetrieved(drugEyeSearchResponse));
    }, failure: (error) {
      emit(
        DrugInteractionState.error(
            error: error.apiErrorModel.message ?? ERR.UNEXPECTED),
      );
    });
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
