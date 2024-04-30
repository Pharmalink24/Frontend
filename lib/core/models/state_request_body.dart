// ignore_for_file: constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:pharmalink/core/enums/drug_state.dart';

part 'state_request_body.g.dart';

@JsonSerializable()
class StateRequestBody {
  DrugState state;

  StateRequestBody({
    required this.state,
  });

  factory StateRequestBody.fromJson(Map<String, dynamic> json) =>
      _$StateRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$StateRequestBodyToJson(this);
}
