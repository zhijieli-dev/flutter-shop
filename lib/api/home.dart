
import 'package:dio/dio.dart';
import 'package:flutter_shop/viewmodel/home.dart';
import 'package:flutter_shop/utils/DioRequest.dart';
import 'package:flutter_shop/constants/index.dart';

Future<List<BannerItem>> getBannerListAPI() async {
  final response = await dioRequest.get(HttpConstants.BANNER_LIST, params: {'limit': 4},);
  final products = response['products'] as List;

  return products.map((item) {
    return BannerItem.fromJson(item as Map<String, dynamic>,);
  }).toList();
}

Future<List<CatogoryItem>> getCategoryListAPI() async {
  final response = await dioRequest.get(HttpConstants.CATEGORY_LIST);
  final categories = response as List;

  return categories.map((item) {
    return CatogoryItem.fromJson(item as Map<String, dynamic>);
  }).toList();
}

Future<List<SuggestionItem>> getSuggestionListAPI() async {
  final response = await dioRequest.get(
    HttpConstants.SUGGESTION_LIST,
    params: {
      'sortBy': 'rating',
      'order': 'desc'
    }
  );
  final suggestions = response['products'] as List;

  return suggestions.map((item) {
    return SuggestionItem.fromJson(item as Map<String, dynamic>);
  }).toList();
}

Future<HotItem> getExpensiveProductAPI() async {
  final response = await dioRequest.get(HttpConstants.HOT_PRODUCT, 
    params: {
      'sortBy': 'price',
      'order': 'desc',
      'limit': 1
    } 
  );

  final products  = response['products'] as List;

  return HotItem.fromJson(products[0] as Map<String, dynamic>);
}

Future<HotItem> getCheaperProductAPI() async {
  final response = await dioRequest.get(HttpConstants.HOT_PRODUCT, 
    params: {
      'sortBy': 'price',
      'order': 'asc',
      'limit': 1
    } 
  );

  final item = response['products'] as List;
  
  return HotItem.fromJson(item[0] as Map<String, dynamic>);
}