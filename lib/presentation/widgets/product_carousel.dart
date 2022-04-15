import 'package:flutter/material.dart';
import 'package:myneweccomerce/presentation/widgets/product_card.dart';

import '../../models/product_model.dart';

class ProductCarousel extends StatelessWidget {
  final List<Product> products;
  const ProductCarousel({Key? key,required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165,
      child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: ProductCard(
                product: products[index],
              widthFactor: 2,
            ),
          );
        },
      ),
    );
  }
}