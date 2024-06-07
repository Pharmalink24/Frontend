
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../../shared/data/data_sources/remote/api/api_constants.dart';

import '../../models/drug_search.dart';
import '../../models/drug_eye_search_request_params.dart';
import '../../models/drug_interaction_request_body.dart';
import '../../models/drug_interaction_response.dart';
import '../../models/interaction.dart';

part 'drug_interaction_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.httpsDomain)
abstract class DrugInteractionApiService {
  factory DrugInteractionApiService(Dio dio, {String baseUrl}) = _DrugInteractionApiService;

  //-------------------- DRUG INTERACTION --------------------//

  @GET(ApiConstants.searchDrugFromDrugEye)
  Future<List<DrugSearch>> searchDrugFromDrugEye(
    @Queries() DrugEyeSearchRequestParams drugEyeSearchRequestParams,
  );

  @POST(ApiConstants.twoDrugInteraction)
  Future<TwoDrugsInteractionResponse> checkInteractionBetweenTwoDrugs(
    @Body() DrugInteractionRequestBody drugInteractionRequestBody,
  );

  @POST(ApiConstants.drugAndMedicationsInteraction)
  Future<List<Interaction>> checkInteractionBetweenDrugAndMedications(
    @Body() DrugInteractionRequestBody drugInteractionRequestBody,
  );
}
