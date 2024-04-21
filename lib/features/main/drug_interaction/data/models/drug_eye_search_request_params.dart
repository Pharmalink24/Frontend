import 'package:json_annotation/json_annotation.dart';

part 'drug_eye_search_request_params.g.dart';

@JsonSerializable()
class DrugEyeSearchRequestParams {
  final String query;

  DrugEyeSearchRequestParams({
    required this.query,
  });

  Map<String, dynamic> toJson() => _$DrugEyeSearchRequestParamsToJson(this);
}
