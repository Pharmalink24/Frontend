import 'package:json_annotation/json_annotation.dart';
import '../../../doctors/data/models/doctor_info.dart';

part 'prescription_doctor.g.dart';

@JsonSerializable()
class PrescriptionDoctor {
  final int id;
  final DoctorInfo doctorInfo;
  @JsonKey(name: 'created_at')
  final String createdAt;

  const PrescriptionDoctor({
    required this.id,
    required this.doctorInfo,
    required this.createdAt,
  });

  DateTime get createdAt_ => DateTime.parse(createdAt).toLocal();

  get date => "${createdAt_.year}-${createdAt_.month}-${createdAt_.day}";

  get hours => createdAt_.hour.toString().padLeft(2, '0');

  get minute => createdAt_.minute.toString().padLeft(2, '0');

  get period => createdAt_.hour >= 12 ? 'PM' : 'AM';

  get time => "$hours:$minute $period";

  factory PrescriptionDoctor.fromJson(Map<String, dynamic> json) =>
      _$PrescriptionDoctorFromJson(json);

  Map<String, dynamic> toJson() => _$PrescriptionDoctorToJson(this);
}
