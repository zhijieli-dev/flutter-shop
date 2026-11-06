import 'package:flutter/material.dart';
import 'package:flutter_shop/viewmodel/home.dart';

class HmSuggestion extends StatefulWidget {

  final List<SuggestionItem> suggestionList;

  const HmSuggestion({
    super.key, 
    required this.suggestionList
  });

  @override
  State<HmSuggestion> createState() => _HmSuggestionState();
}

class _HmSuggestionState extends State<HmSuggestion> {

  Widget _buildSuggestionItem(SuggestionItem suggestion) {
    return Container(
      width: 170,
      margin: const EdgeInsets.only(left: 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.15),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            suggestion.imageUrl,
            height: 110,
            width: double.infinity,
            fit: BoxFit.contain,
          ),

          const SizedBox(height: 8),

          Text(
            suggestion.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 5),

          Text('€ ${suggestion.price.toStringAsFixed(2)}'),

          Row(
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 18),
              Text(suggestion.rating.toString()),
            ],
          ),

          Text(
            '-${suggestion.discountPercentage}%',
            style: const TextStyle(color: Colors.red),
          ),
        ],
      ),
    );
}

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'Suggestion',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 15),

          SizedBox(
            height: 260,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.suggestionList.length,
              itemBuilder: (context, index) {
                final suggestion = widget.suggestionList[index];
                return _buildSuggestionItem(suggestion);
              },
            ),
          ),
        ],
      ),
    );
  }
}