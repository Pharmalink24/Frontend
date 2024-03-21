part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

class PatientSignUpSuccessful extends SignupState {
  final Patient patient;

  PatientSignUpSuccessful(this.patient);
}

class DoctorSignUpSuccessful extends SignupState {
  final Doctor doctor;

  DoctorSignUpSuccessful(this.doctor);
}

class SignUpError extends SignupState {
  final String error;

  SignUpError(this.error);
}
