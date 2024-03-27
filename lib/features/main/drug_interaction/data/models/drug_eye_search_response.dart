// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part "drug_eye_search_response.g.dart";

@JsonSerializable()
class DrugEyeSearchResponse {
  final String commercialName;
  DrugEyeSearchResponse({required this.commercialName});

  factory DrugEyeSearchResponse.fromJson(Map<String, dynamic> json) =>
      _$DrugEyeSearchResponseFromJson(json);
}
