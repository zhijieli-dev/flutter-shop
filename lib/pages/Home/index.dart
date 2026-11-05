import 'package:flutter/material.dart';
import 'package:flutter_shop/components/Home/HmSlider.dart';
import 'package:flutter_shop/components/Home/HmCategory.dart';
import 'package:flutter_shop/components/Home/HmSuggestion.dart';
import 'package:flutter_shop/components/Home/HmHot.dart';
import 'package:flutter_shop/components/Home/HmMoreList.dart';
import 'package:flutter_shop/viewmodel/home.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final List<BannerItem> _bannerList = [
    BannerItem(id: '1', imageUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=1200'),
    BannerItem(id: '2', imageUrl: 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=1200'),
    BannerItem(id: '3', imageUrl: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=1200'),
  ];

  List<Widget> _getScrollChildren() {
    return [

      SliverToBoxAdapter(child: HmSlider(bannerList: _bannerList)),

      SliverToBoxAdapter(child: SizedBox(height: 10)),

      SliverToBoxAdapter(child: HmCategory()),

      SliverToBoxAdapter(child: SizedBox(height: 10)),

      SliverToBoxAdapter(child: HmSuggestion()),

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
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: _getScrollChildren(),
    );
  }
}
    