import 'package:flutter/material.dart';
import 'package:flutter_shop/viewmodel/home.dart';

class HmHot extends StatefulWidget {
  final HotItem? hotItem;
  final String label;

  const HmHot({
    super.key,
    required this.hotItem,
    required this.label,
  });

  @override
  State<HmHot> createState() => _HmHotState();
}

class _HmHotState extends State<HmHot> {

  Widget getProductInfo() {
    final product = widget.hotItem!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          product.imageUrl,
          height: 110,
          width: double.infinity,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return const SizedBox(
              height: 110,
              child: Icon(Icons.broken_image, size: 35),
            );
          },
        ),

        const SizedBox(height: 12),

        Text(
          product.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),

        const SizedBox(height: 8),

        Text(
          '€ ${product.price.toStringAsFixed(2)}',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.deepOrange,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.hotItem == null) {
      return const SizedBox(
        height: 230,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Container(
      height: 280,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: getProductInfo(),
          ),
        ],
      ),
    );
  }
}