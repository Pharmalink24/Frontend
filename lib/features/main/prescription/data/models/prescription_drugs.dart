import 'package:json_annotation/json_annotation.dart';
import '../../../../../core/models/drug_info.dart';

part 'prescription_drugs.g.dart';

@JsonSerializable()
class PrescriptionDrugs {
  final int id;
  @JsonKey(name: 'doctor_id')
  final int doctorId;
  @JsonKey(name: 'user_id')
  final int userId;
  @JsonKey(name: 'created_at')
  final String createdAt;
  final Map<String, DrugInfo> drugs;

  const PrescriptionDrugs({
    required this.id,
    required this.doctorId,
    required this.userId,
    required this.createdAt,
    required this.drugs,
  });

  DateTime get createdAt_ => DateTime.parse(createdAt).toLocal();

  get date => "${createdAt_.year}-${createdAt_.month}-${createdAt_.day}";

  get hours => createdAt_.hour.toString().padLeft(2, '0');

  get minute => createdAt_.minute.toString().padLeft(2, '0');

  get period => createdAt_.hour >= 12 ? 'PM' : 'AM';

  get time => "$hours:$minute $period";

  factory PrescriptionDrugs.fromJson(Map<String, dynamic> json) =>
      _$PrescriptionDrugsFromJson(json);

  Map<String, dynamic> toJson() => _$PrescriptionDrugsToJson(this);
}
