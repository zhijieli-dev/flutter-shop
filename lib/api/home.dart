
import 'package:dio/dio.dart';
import 'package:flutter_shop/viewmodel/home.dart';
import 'package:flutter_shop/utils/DioRequest.dart';
import 'package:flutter_shop/constants/index.dart';

Future<List<BannerItem>> getBannerListAPI() async {
  final response = await dioRequest.get(
    HttpConstants.BANNER_LIST,
    params: {'limit': 4},
  );

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