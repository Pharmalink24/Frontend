import 'package:json_annotation/json_annotation.dart';

part 'drug_interaction_request_body.g.dart';

@JsonSerializable()
class DrugInteractionRequestBody {
  @JsonKey(name: 'trade_name1')
  final String tradename1;
  @JsonKey(name: 'trade_name2')
  final String tradename2;

  DrugInteractionRequestBody({
    required this.tradename1,
    required this.tradename2,
  });

  Map<String, dynamic> toJson() => _$DrugInteractionRequestBodyToJson(this);
}
