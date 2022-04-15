import 'package:flutter/material.dart';
import 'package:myneweccomerce/bloc/cart/cart_bloc.dart';
import 'package:provider/src/provider.dart';

import '../../models/product_model.dart';
import 'widgets.dart';




class CartProductCard extends StatelessWidget {
  CartProductCard({Key? key,required this.product,required this.quantity}) : super(key: key);
  final Product product;
  final int quantity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
          children: [
            Column(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Image.network(product.imageUrl,width: 100,height: 80,fit: BoxFit.cover,),
                        SizedBox(width: 10,),
                        Expanded(
                          child: Column(
                            children: [
                              Text(product.name,style: Theme.of(context).textTheme.headline5,),
                              Text(product.price.toString(),style: Theme.of(context).textTheme.headline6,)
                            ],
                          ),
                        ),
                        SizedBox(width: 10,),
                        Row(
                          children: [
                            IconButton(onPressed: (){
                              context.read<CartBloc>().add(CartProductRemoved(product));
                            }, icon: Icon(Icons.remove_circle)),
                            Text("$quantity",style: Theme.of(context).textTheme.headline5,),
                            IconButton(onPressed: (){
                              context.read<CartBloc>().add(CartProductAdded(product));
                            }, icon: Icon(Icons.add_circle)),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ],
      ),
    );
  }
}
