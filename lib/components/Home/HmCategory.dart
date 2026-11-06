
import 'package:flutter/material.dart';
import 'package:flutter_shop/viewmodel/home.dart';

class HmCategory extends StatefulWidget {
  final List<CatogoryItem> categoryList;

  const HmCategory({
    super.key,
    required this.categoryList,
  });

  @override
  State<HmCategory> createState() => _HmCategoryState();
}

class _HmCategoryState extends State<HmCategory> {

  IconData _getCategoryIcon(String slug) {
    switch (slug) {
      case 'beauty':
        return Icons.face;
      case 'fragrances':
        return Icons.spa;
      case 'furniture':
        return Icons.chair;
      case 'groceries':
        return Icons.shopping_basket;
      case 'smartphones':
        return Icons.smartphone;
      case 'laptops':
        return Icons.laptop;
      default:
        return Icons.category;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categoryList.length,
        itemBuilder: (BuildContext context, int index) {
          final category = widget.categoryList[index];

          return Container(
            alignment: Alignment.center,
            width: 100,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  _getCategoryIcon(category.slug),
                  size: 45,
                  color: Colors.blue,
                ),
                const SizedBox(height: 5),
                Text(
                  category.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
