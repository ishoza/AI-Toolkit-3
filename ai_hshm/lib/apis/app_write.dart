import 'dart:developer';

import 'package:appwrite/appwrite.dart';

import '../helper/global.dart';

class AppWrite {
  static final _client = Client();
  static final _database = Databases(_client);

  static void init() {
    _client
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setProject('6756f8be003b42dff8f3')
        .setSelfSigned(status: true);
    getApiKey();
  }

  static Future<String> getApiKey() async {
    try {
      final d = await _database.getDocument(
          databaseId: 'MyDatabase',
          collectionId: 'ApiKey',
          documentId: 'chatGptKey');

      // ApiKey = d.data['apiKey'];
      log(ApiKey);
      return ApiKey;
    } catch (e) {
      log('$e');
      return '';
    }
  }
}
