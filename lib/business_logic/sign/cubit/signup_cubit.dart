import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pharmalink/data/models/signup/doctor.dart';
import 'package:pharmalink/data/models/signup/patient.dart';
import 'package:pharmalink/data/repository/signup_repo.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepository signupRepository;
  late Patient patient;
  late Doctor doctor;

  SignupCubit(this.signupRepository) : super(SignupInitial());

  Patient signupPatient(Map body) {
    signupRepository.signupPatient(body).then((patient) {
      emit(PatientSignUpSuccessful(patient));
      this.patient = patient;
    });

    return patient;
  }

  Doctor signupDoctor(Map body) {
    signupRepository.signupDoctor(body).then((doctor) {
      emit(DoctorSignUpSuccessful(doctor));
      this.doctor = doctor;
    });

    return doctor;
  }
}
