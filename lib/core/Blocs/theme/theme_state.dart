import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_state.freezed.dart';

@freezed
class ThemeState<ThemeData> with _$ThemeState<ThemeData> {
  const factory ThemeState.dark(ThemeData data) = Dark<ThemeData>;
  const factory ThemeState.light(ThemeData data) = Light<ThemeData>;
}
