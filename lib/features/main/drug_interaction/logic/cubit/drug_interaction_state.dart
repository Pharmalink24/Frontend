import 'package:freezed_annotation/freezed_annotation.dart';

part 'drug_interaction_state.freezed.dart';

@freezed
class DrugInteractionState<T> with _$DrugInteractionState<T> {
  const factory DrugInteractionState.initial() = _Initial;
  const factory DrugInteractionState.loading() = Loading;
  const factory DrugInteractionState.searchedDrugsRetrieved(T data) = SearchedDrugsRetrieved<T>;
  const factory DrugInteractionState.drugInteractionRetrieved(T data) = DrugInteractionSuccess<T>;
  const factory DrugInteractionState.error({required String error}) = Error;
}
