import 'package:pharmalink/data/models/signup/doctor.dart';
import 'package:pharmalink/data/models/signup/patient.dart';
import 'package:pharmalink/data/web_services/signup_web_services.dart';

class SignupRepository {
  final SignupWebServices signupWebServices;

  SignupRepository(this.signupWebServices);

  Future<Patient> signupPatient(Map body) async {
    final patient = await signupWebServices.signupPatient(body);
    return Patient.fromJson(patient);
  }

  Future<Doctor> signupDoctor(Map body) async {
    final doctor = await signupWebServices.signupDoctor(body);
    return Doctor.fromJson(doctor);
  }
}
