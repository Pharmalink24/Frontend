import 'package:json_annotation/json_annotation.dart';
import 'drug_info.dart';

part 'prescription_info.g.dart';

@JsonSerializable()
class PrescriptionInfo {
  final int id;
  @JsonKey(name: 'doctor_id')
  final int doctorId;
  @JsonKey(name: 'user_id')
  final int userId;
  @JsonKey(name: 'created_at')
  final String createdAt;
  final String diagnosis;
  @JsonKey(name: 'doctor_notes')
  final String doctorNotes;
  final String tests;
  @JsonKey(name: 'next_visit')
  final String nextVisit;
  final Map<String, DrugInfo> drugs;

  const PrescriptionInfo({
    required this.id,
    required this.doctorId,
    required this.userId,
    required this.createdAt,
    required this.diagnosis,
    required this.doctorNotes,
    required this.tests,
    required this.nextVisit,
    required this.drugs,
  });

  DateTime get createdAt_ => DateTime.parse(createdAt).toLocal();

  get date => "${createdAt_.year}-${createdAt_.month}-${createdAt_.day}";

  get hours => createdAt_.hour.toString().padLeft(2, '0');

  get minute => createdAt_.minute.toString().padLeft(2, '0');

  get period => createdAt_.hour >= 12 ? 'PM' : 'AM';

  get time => "$hours:$minute $period";

  factory PrescriptionInfo.fromJson(Map<String, dynamic> json) =>
      _$PrescriptionInfoFromJson(json);

  Map<String, dynamic> toJson() => _$PrescriptionInfoToJson(this);
}
