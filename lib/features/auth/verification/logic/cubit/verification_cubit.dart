import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'verification_state.dart';
part 'verification_cubit.freezed.dart';

class VerificationCubit extends Cubit<VerificationState> {
  VerificationCubit() : super(VerificationState.initial());
}
