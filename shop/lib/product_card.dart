import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String tite;
  final double price;
  final String image;
  const ProductCard({super.key, required this.tite, required this.price, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(216, 240, 253, 1),
      child: Column(
        children: [
          Text(tite),
          const SizedBox(
            height: 5,
          ),
          Text('\$ $price'),
          const SizedBox(
            height: 5,
          ),
          Image(image: AssetImage(image),),
        ],
      ),
    );
  }
}
