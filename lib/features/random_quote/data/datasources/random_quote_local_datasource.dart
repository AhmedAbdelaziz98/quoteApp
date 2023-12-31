import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/utils/app_strings.dart';
import '../models/quote_model.dart';

abstract class RandomQuoteLocalDataSource {
  Future<QuoteModel> getLastRandomQuote();
  Future<void> cacheQuote(QuoteModel quote);
}

class RandomQuoteLocalDataSourceImpl implements RandomQuoteLocalDataSource {
  final SharedPreferences sharedPreferences;
  RandomQuoteLocalDataSourceImpl({
    required this.sharedPreferences,
  });
  @override
  Future<void> cacheQuote(QuoteModel quote) async {
    sharedPreferences.setString(
        AppStrings.cachedRandomQuote, json.encode(quote));
  }

  @override
  Future<QuoteModel> getLastRandomQuote() async {
    final jsonString =
        sharedPreferences.getString(AppStrings.cachedRandomQuote);
    if (jsonString != null) {
      final cachedRandomQuote = QuoteModel.fromJson(json.decode(jsonString));
      return cachedRandomQuote;
    } else {
      throw CacheException();
    }
  }
}
