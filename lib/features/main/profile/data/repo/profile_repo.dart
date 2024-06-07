import 'package:logger/logger.dart';

import '../../../../../core/di/dependency_injection.dart';
import '../../../../../shared/domain/entities/models/user.dart';
import '../../../../../shared/data/data_sources/remote/api/api_error_handler.dart';
import '../../../../../shared/data/data_sources/remote/api/api_result.dart';
import '../../../../../shared/data/data_sources/remote/api/api_service.dart';

class ProfileRepo {
  final ApiService _apiService;
  ProfileRepo(this._apiService);

  Future<ApiResult<User>> getUserInformation() async {
    try {
      final user = await _apiService.getUserInformation(
      );
      return ApiResult.success(user);
    } catch (error) {
      getIt<Logger>().e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
