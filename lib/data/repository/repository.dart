import 'package:app_idea_generator/data/models/completions/post_completions_resp.dart';

import '../apiClient/api_client.dart';

class Repository {
  var _apiClient = ApiClient();

  Future<PostCompletionsResp> createCompletions({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    return await _apiClient.createCompletions(
      headers: headers,
      requestData: requestData,
    );
  }
}
