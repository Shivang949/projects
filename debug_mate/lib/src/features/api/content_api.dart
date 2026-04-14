import 'package:sanity_client/sanity_client.dart';

import '../model/content_model.dart';

class ContentService {
  final client = SanityClient(
    SanityConfig(
      projectId: 'kmw1sw5y',
      dataset: 'production',
      apiVersion: 'v2024-02-16',
      useCdn: true,
    ),
  );

  Future<ContentModel?> fetchContent(String identifier) async {
    final query = '*[_type == "page" && identifier == "$identifier"][0]';
    try {
      final response = await client.fetch(query);

      final data = response.result;

      if (data is Map<String, dynamic>) {
        return ContentModel.fromJson(data);
      }
      return null;
    }catch (e) {
      throw Exception(e.toString());
    }

  }
}