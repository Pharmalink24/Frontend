import 'package:json_annotation/json_annotation.dart';

part 'drug_eye_search_request_params.g.dart';

@JsonSerializable()
class DrugEyeSearchRequestParams {
  final String query;

  DrugEyeSearchRequestParams({
    required this.query,
  });

  factory DrugEyeSearchRequestParams.fromJson(Map<String, dynamic> json) =>
      _$DrugEyeSearchRequestParamsFromJson(json);
      
  Map<String, dynamic> toJson() => _$DrugEyeSearchRequestParamsToJson(this);
}
