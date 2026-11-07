import 'package:flutter/material.dart';

class BannerItem {
  final int id;
  final String imageUrl;
  BannerItem({required this.id, required this.imageUrl});

  factory BannerItem.fromJson(Map<String, dynamic> json) {
    return BannerItem(id: json['id'], imageUrl: json['thumbnail']);
  }
}

class CatogoryItem {
  final String slug;
  final String name;
  final String url;

  CatogoryItem({required this.slug, required this.name, required this.url});

  factory CatogoryItem.fromJson(Map<String, dynamic> json) {
    return CatogoryItem(slug: json['slug'], name: json['name'], url: json['url']);
  }
}

class SuggestionItem {
  final int id;
  final String title;
  final double price;
  final double rating;
  final String imageUrl;
  final double discountPercentage;

  SuggestionItem({required this.id, required this.title, required this.price, required this.rating, required this.imageUrl, required this.discountPercentage});

  factory SuggestionItem.fromJson(Map<String, dynamic> json){
    return SuggestionItem(id: json['id'], title: json['title'], price: json['price'], rating: json['rating'], imageUrl: json['thumbnail'], discountPercentage: json['discountPercentage']);
  }

}

class HotItem {
  final int id;
  final String title; 
  final double price;
  final String imageUrl;

  HotItem({required this.id, required this.title, required this.price, required this.imageUrl});

  factory HotItem.fromJson(Map<String, dynamic> json) {
    return HotItem(id: json['id'], title: json['title'], price: json['price'], imageUrl: json['thumbnail']);
  }

}