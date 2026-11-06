import 'package:flutter/material.dart';
import 'package:flutter_shop/components/Home/HmSlider.dart';
import 'package:flutter_shop/components/Home/HmCategory.dart';
import 'package:flutter_shop/components/Home/HmSuggestion.dart';
import 'package:flutter_shop/components/Home/HmHot.dart';
import 'package:flutter_shop/components/Home/HmMoreList.dart';
import 'package:flutter_shop/viewmodel/home.dart';
import 'package:flutter_shop/api/home.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  List<BannerItem> _bannerList = [];
  List<CatogoryItem> _categoryList = [];
  List<SuggestionItem> _suggestionList = [];

  List<Widget> _getScrollChildren() {
    return [

      SliverToBoxAdapter(child: HmSlider(bannerList: _bannerList)),

      SliverToBoxAdapter(child: SizedBox(height: 10)),

      SliverToBoxAdapter(child: HmCategory(categoryList: _categoryList)),

      SliverToBoxAdapter(child: SizedBox(height: 10)),

      SliverToBoxAdapter(child: HmSuggestion(suggestionList: _suggestionList)),

      SliverToBoxAdapter(child: SizedBox(height: 10)),

      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(child: HmHot()),
              SizedBox(width: 10),
              Expanded(child: HmHot())
            ],
          )
        ),
      ),

      SliverToBoxAdapter(child: SizedBox(height: 10)),

      HmMoreList()

    ];
  }

  @override
  void initState() {
    super.initState();
    _getBannerList();
    _getCategoryList();
    _getSuggestionList();
  }

  void _getBannerList() async {
    final result = await getBannerListAPI();
    setState(() { 
      _bannerList = result; 
    });
  }

  void _getCategoryList() async {
    final result = await getCategoryListAPI();
    setState(() { 
      _categoryList = result; 
    });
  }

  void _getSuggestionList() async {
    final result = await getSuggestionListAPI();
    setState(() { 
      _suggestionList = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: _getScrollChildren(),
    );
  }
}
    