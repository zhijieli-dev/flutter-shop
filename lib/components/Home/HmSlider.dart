
import 'package:flutter/material.dart';
import 'package:flutter_shop/viewmodel/home.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HmSlider extends StatefulWidget {
  final List<BannerItem> bannerList;

  const HmSlider({super.key, required this.bannerList});

  @override
  State<HmSlider> createState() => _HmSliderState();
}

class _HmSliderState extends State<HmSlider> {
  final CarouselSliderController _carouselController = CarouselSliderController();

  int _currentIndex = 0;

  Widget _getSlider() {
    final double screenWidth = MediaQuery.of(context).size.width;

    return CarouselSlider(
      carouselController: _carouselController,
      items: widget.bannerList.map((banner) {
        return Image.network(
          banner.imageUrl,
          width: screenWidth,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return const Center(
              child: Icon(Icons.broken_image, size: 40),
            );
          },
        );
      }).toList(),
      options: CarouselOptions(
        height: 300,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 1,
        onPageChanged: (index, reason) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  Widget _getSearch() {
    return Positioned(
      top: 10,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          height: 50,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(0, 0, 0, 0.4),
            borderRadius: BorderRadius.circular(25),
          ),
          child: const Text(
            "Search...",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  Widget _getIndicator() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 10,
      child: SizedBox(
        height: 40,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.bannerList.length, (index) {
            return GestureDetector(
              onTap: () {
                _carouselController.animateToPage(index);
              },
              child: Container(
                width: index == _currentIndex ? 40 : 20,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: _currentIndex == index ? Colors.white : Colors.grey,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.bannerList.isEmpty) {
      return const SizedBox(
        height: 300,
        child: Center(
          child: Text('Nessun banner disponibile'),
        ),
      );
    }

    return Stack(
      children: [
        _getSlider(),
        _getSearch(),
        _getIndicator(),
      ],
    );
  }
}
