import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_page_state.freezed.dart';

@freezed
class HomePageState<T> with _$HomePageState<T> {
  const factory HomePageState.initial() = _Initial;
  const factory HomePageState.loading() = Loading;
  const factory HomePageState.success(T data) =
      success<T>;
  const factory HomePageState.error({required String error}) = Error;
}
