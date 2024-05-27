import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../../../core/models/drug_search.dart';
import '../../data/models/drug_eye_search_request_params.dart';
import '../../data/models/drug_interaction_request_body.dart';
import '../../data/repo/drug_interaction_repo.dart';
import '../../../../../core/helpers/errors.dart';
import 'drug_interaction_state.dart';

class DrugInteractionCubit extends Cubit<DrugInteractionState> {
  final DrugInteractionRepo _drugInteractionRepo;
  List<DrugSearch>? drugs;

  DrugInteractionCubit(this._drugInteractionRepo)
      : super(const DrugInteractionState.initial());

  TextEditingController drugController1 = TextEditingController();
  TextEditingController drugController2 = TextEditingController();
  String activeIngredient1 = '';
  String activeIngredient2 = '';

  final form1Key = GlobalKey<FormState>();
  final form2Key = GlobalKey<FormState>();

  int selectedTabIndex = 0;

  void selectTab(int index) {
    selectedTabIndex = index;
  }

  Future<List<DrugSearch>?> getDrugSearchSuggestion(
      {required int drugId}) async {
    await _drugInteractionRepo
        .searchDrugFromDrugEye(
          DrugEyeSearchRequestParams(
            query: drugId == 1 ? drugController1.text : drugController2.text,
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
        activeIngredient1: activeIngredient1,
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

  void setActiveIngredients(DrugSearch drug, int drugId) {
    if (drugId == 1) {
      activeIngredient1 = drug.activeIngredient;
    } else {
      activeIngredient2 = drug.activeIngredient;
    }
  }
}
