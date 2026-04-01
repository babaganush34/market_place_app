import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

const Color priceColor = Colors.green;
const double imageHeight = 120;
const double cardRadius = 16;
const double paddingSize = 12;

class ProductCard extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final List<String> tags;
  final double rating;
  final VoidCallback onAddToCart;

  const ProductCard({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.tags,
    required this.rating,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(paddingSize),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 239, 218),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(cardRadius),
                child: CachedNetworkImage(
                  imageUrl: image,
                  height: imageHeight,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),

              SizedBox(height: 4),
              Text(
                price,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.green,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 6),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 4,
            runSpacing: 4,
            children: tags
                .map(
                  (tag) => Container(
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Center(
                      child: Text(
                        tag,
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(5, (index) {
                return Icon(
                  index < rating ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: 16,
                );
              }),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    textStyle: const TextStyle(fontSize: 12),
                  ),
                  child: Text('Купить'),
                ),
              ),
              const SizedBox(width: 4),
              IconButton(onPressed: onAddToCart, icon: Icon(Icons.favorite)),
            ],
          ),
        ],
      ),
    );
  }
}
