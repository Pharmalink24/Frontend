import 'package:json_annotation/json_annotation.dart';

import 'doctor.dart';
import 'drug.dart';

part 'home_page_response.g.dart';

@JsonSerializable()
class HomePageResponse {
  @JsonKey(name: "first_name")
  final String firstName;
  final List<Doctor> doctors;
  final List<Drug> drugs;

  const HomePageResponse({
    required this.firstName,
    required this.doctors,
    required this.drugs,
  });

  factory HomePageResponse.fromJson(Map<String, dynamic> json) =>
      _$HomePageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomePageResponseToJson(this);
}
