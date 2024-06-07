import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../data/models/drug_search.dart';
import '../../data/models/drug_eye_search_request_params.dart';
import '../../data/models/drug_interaction_request_body.dart';
import '../../data/repositories/drug_interaction_repo.dart';
import '../../../../../core/helpers/constants/errors.dart';
import 'drug_interaction_state.dart';

enum DrugFieldId {
  withMedication,
  betweenTwoDrugsFirst,
  betweenTwoDrugsSecond,
}

class DrugInteractionCubit extends Cubit<DrugInteractionState> {
  final DrugInteractionRepo _drugInteractionRepo;
  List<DrugSearch>? drugs;

  DrugInteractionCubit(this._drugInteractionRepo)
      : super(const DrugInteractionState.initial());

  // Drug Controller
  TextEditingController drugController0 = TextEditingController();
  TextEditingController drugController1 = TextEditingController();
  TextEditingController drugController2 = TextEditingController();

  // Active Ingredients
  String activeIngredient0 = '';
  String activeIngredient1 = '';
  String activeIngredient2 = '';

  // Form Keys
  final form1Key = GlobalKey<FormState>();
  final form2Key = GlobalKey<FormState>();

  // Selected Tab Index
  int selectedTabIndex = 0;

  void selectTab(int index) {
    selectedTabIndex = index;
  }

  Future<List<DrugSearch>?> getDrugSearchSuggestion(
      {required DrugFieldId drugId}) async {
    await _drugInteractionRepo
        .searchDrugFromDrugEye(
          DrugEyeSearchRequestParams(
            query: getControllerText(drugId),
          ),
        )
        .then(
          (response) => response.when(
            success: (drugs) {
              emit(DrugInteractionState.searchedDrugsRetrieved(drugs));
              this.drugs = drugs;
            },
            failure: (error) {
              emit(
                DrugInteractionState.error(
                  error: error.apiErrorModel.error ?? ERR.UNEXPECTED,
                ),
              );
              drugs = null;
            },
          ),
        );

    return drugs;
  }

  void emitTwoDrugInteractionStates() async {
    emit(const DrugInteractionState.loading());

    final response = await _drugInteractionRepo.checkInteractionBetween2Drugs(
      DrugInteractionRequestBody(
        activeIngredient1: activeIngredient1,
        activeIngredient2: activeIngredient2,
      ),
    );

    response.when(
      success: (drugInteractionResponse) {
        emit(DrugInteractionState.twoDrugSInteractionSuccess(
            drugInteractionResponse));
      },
      failure: (error) {
        emit(
          DrugInteractionState.error(
              error: error.apiErrorModel.error ?? ERR.UNEXPECTED),
        );
      },
    );
  }

  void emitOneDrugInteractionStates() async {
    emit(const DrugInteractionState.loading());

    final response =
        await _drugInteractionRepo.checkInteractionBetweenDrugAndMedications(
      DrugInteractionRequestBody(
        activeIngredient: activeIngredient0,
      ),
    );

    response.when(
      success: (interactions) {
        emit(
          DrugInteractionState.drugAndMedicationsInteractionSuccess(
              interactions),
        );
      },
      failure: (error) {
        emit(
          DrugInteractionState.error(
              error: error.apiErrorModel.error ?? ERR.UNEXPECTED),
        );
      },
    );
  }

  String getControllerText(DrugFieldId drugId) {
    switch (drugId) {
      case DrugFieldId.withMedication:
        return drugController0.text;
      case DrugFieldId.betweenTwoDrugsFirst:
        return drugController1.text;
      case DrugFieldId.betweenTwoDrugsSecond:
        return drugController2.text;
      default:
        return '';
    }
  }

  void setActiveIngredients(DrugSearch drug, DrugFieldId drugId) {
    switch (drugId) {
      case DrugFieldId.withMedication:
        activeIngredient0 = drug.activeIngredient;
      case DrugFieldId.betweenTwoDrugsFirst:
        activeIngredient1 = drug.activeIngredient;
      case DrugFieldId.betweenTwoDrugsSecond:
        activeIngredient2 = drug.activeIngredient;
    }
  }
}
