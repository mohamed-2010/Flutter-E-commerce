import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myneweccomerce/bloc/cart/cart_bloc.dart';
import 'package:myneweccomerce/models/product_model.dart';

import '../../bloc/wishlist/wishlist_bloc.dart';

class ProductCard extends StatelessWidget {
  ProductCard(
      {Key? key,
      required this.product,
      this.widthFactor = 2.5,
      this.leftPoition = 5,
      this.isWishList = false})
      : super(key: key);
  Product product;
  final double widthFactor;
  final double leftPoition;
  final bool isWishList;
  @override
  Widget build(BuildContext context) {
    final double widthValue = MediaQuery.of(context).size.width / widthFactor;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/product', arguments: product);
      },
      child: Stack(
        children: [
          Container(
            width: widthValue,
            height: 150,
            decoration: BoxDecoration(
              borderRadius:BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(product.imageUrl,),
                fit: BoxFit.cover,
              )
            ),
          ),
          Positioned(
            top: 60,
            left: leftPoition,
            child: Container(
              width: widthValue - 10 - leftPoition,
              height: 80,
              decoration: BoxDecoration(
                  color: Colors.black.withAlpha(50),
                  borderRadius: BorderRadius.circular(15)
              ),
            ),
          ),
          Positioned(
            top: 65,
            left: leftPoition + 5,
            child: Container(
              width: widthValue - 20 - leftPoition,
              height: 70,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15)
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(color: Colors.white),
                          ),
                          Text(
                            product.price.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: BlocBuilder<CartBloc, CartState>(
                        builder: (context, state) {
                          return IconButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Added to your Cart!'),
                                ),
                              );
                              context
                                  .read<CartBloc>()
                                  .add(CartProductAdded(product));
                            },
                            icon: Icon(
                              Icons.add_circle,
                              color: Colors.white,
                            ),
                          );
                        },
                      ),
                    ),
                    isWishList
                        ? Expanded(
                            child: BlocBuilder<WishlistBloc, WishlistState>(
                              builder: (context, state) {
                                return IconButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Product Removed!'),
                                      ),
                                    );
                                    context.read<WishlistBloc>().add(
                                        RemoveProductFromWishlist(product));
                                  },
                                  icon: Icon(
                                    Icons.delete_outline,
                                    color: Colors.white,
                                  ),
                                );
                              },
                            ),
                          )
                        : SizedBox()
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
