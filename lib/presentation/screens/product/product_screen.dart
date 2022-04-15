import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myneweccomerce/bloc/wishlist/wishlist_bloc.dart';
import 'package:myneweccomerce/models/models.dart';

import '../../../bloc/cart/cart_bloc.dart';
import '../../widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({Key? key, required this.product}) : super(key: key);
  final Product product;
  static const String routeName = '/product';

  static Route route({required Product product}) {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => ProductScreen(
              product: product,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CoustomAppBarWidget(title: product.name),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          height: 60,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.share,
                      color: Colors.white,
                    )),
                BlocBuilder<WishlistBloc, WishlistState>(
                  builder: (context, state) {
                    return IconButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Added to your Wishlist!'),
                            ),
                          );
                          context
                              .read<WishlistBloc>()
                              .add(AddProductToWishlist(product));
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.white,
                        ));
                  },
                ),
                BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    return ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Added to your Cart!'),
                            ),
                          );
                          context
                              .read<CartBloc>()
                              .add(CartProductAdded(product));
                        },
                        child: Text(
                          'Add To Cart',
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(color: Colors.white),
                        ));
                  },
                )
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
              child: CarouselSlider(
            options: CarouselOptions(
                aspectRatio: 1.5,
                viewportFraction: 0.9,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height),
            items: [
              HeroCarouselCard(
                product: product,
              )
            ],
          )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  alignment: Alignment.bottomCenter,
                  color: Colors.black.withAlpha(50),
                ),
                Container(
                  margin: const EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width - 10,
                  height: 50,
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.name,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: Colors.white),
                        ),
                        Text(
                          product.price.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                'Product Information',
                style: Theme.of(context).textTheme.headline3,
              ),
              children: [
                ListTile(
                  title: Text(
                    "iugyiudfyuigiojom jkguigoijpo uguihiojpiogdtedtyd yr6r5e56e76f yu6r76r78t",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                'Delivery Information',
                style: Theme.of(context).textTheme.headline3,
              ),
              children: [
                ListTile(
                  title: Text(
                    "iugyiudfyuigiojom jkguigoijpo uguihiojpiogdtedtyd yr6r5e56e76f yu6r76r78t",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
