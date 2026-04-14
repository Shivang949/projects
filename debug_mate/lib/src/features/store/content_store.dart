import 'package:debug_mate/src/features/api/content_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/content_model.dart';

class ContentStore extends ChangeNotifier {
  final ContentService _contentApi = ContentService();
  final Map<String, ContentModel> _cacheOffers= {};
  final String username = '';

  ContentModel? finalOffer;
  bool isLoading = false;

  Future<void> fetchOffers(String pageIdentifier) async {

    if (_cacheOffers.containsKey(pageIdentifier)) {
      finalOffer = _cacheOffers[pageIdentifier];
      return;
    }
    isLoading = true;
    notifyListeners();
    try {
      finalOffer = await _contentApi.fetchContent(pageIdentifier);
      _cacheOffers[pageIdentifier] = finalOffer!;
        } catch(e) {
      debugPrint(e.toString());
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> setSessionStorageKey(String username) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('UserName', username);
  }

  Future<void> getSessionStorageKey(String username) async {
    final prefs = await SharedPreferences.getInstance();
    username = prefs.getString('UserName') ?? '';
  }

}
