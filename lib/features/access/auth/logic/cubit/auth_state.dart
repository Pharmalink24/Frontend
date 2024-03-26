import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pharmalink/features/access/signin/data/models/signin_response.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState<T> with _$AuthState<T> {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.accessTokenAuth(String? token) = accessTokenAuth<T>;
  const factory AuthState.authorization(SigninResponse? userAuth) = authorization<T>;
  const factory AuthState.loggedIn(bool isLogged) = loggedIn<T>;
  const factory AuthState.loggedOut(bool isLogged) = loggedOut<T>;
  const factory AuthState.error({required String error}) = Error;
}
