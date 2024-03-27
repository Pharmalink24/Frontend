import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pharmalink/features/access/signin/data/models/signin_response.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState<T> with _$AuthState<T> {
  const factory AuthState.initial() = initial;
  const factory AuthState.authorized(SigninResponse? response) = authorized<T>;
}
