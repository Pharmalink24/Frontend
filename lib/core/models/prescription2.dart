import 'package:json_annotation/json_annotation.dart';
import 'drug_info.dart';

part 'prescription2.g.dart';

@JsonSerializable()
class Prescription2 {
  final int id;
  @JsonKey(name: 'doctor_id')
  final int doctorId;
  @JsonKey(name:'user_id')
  final int userId;
  @JsonKey(name: 'created_at')
  final String createdAt;
  final Map<String, DrugInfo> drugs;

  const Prescription2({
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

  factory Prescription2.fromJson(Map<String, dynamic> json) =>
      _$Prescription2FromJson(json);

  Map<String, dynamic> toJson() => _$Prescription2ToJson(this);
}
