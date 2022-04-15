import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myneweccomerce/bloc/wishlist/wishlist_bloc.dart';

import '../../../models/product_model.dart';
import '../../widgets/product_card.dart';
import '../../widgets/widgets.dart';

class MyWishesScreen extends StatelessWidget {
  const MyWishesScreen({Key? key}) : super(key: key);

  static const String routeName = '/mywishes';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => MyWishesScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CoustomAppBarWidget(title: "Wishes"),
      bottomNavigationBar: CoustomNavBar(),
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if(state is WishlistLoading){
            return Center(child: CircularProgressIndicator(),);
          }else if(state is WishlistLoaded){
            return GridView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 16.0,
                ),
                itemCount: state.wishlist.products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, childAspectRatio: 2.2),
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: ProductCard(
                      product: state.wishlist.products[index],
                      widthFactor: 1.1,
                      leftPoition: 100,
                      isWishList: true,
                    ),
                  );
                });
          }else{
            return Center(child: Text("Some Thing Is Ronge"),);
          }
        },
      ),
    );
  }
}
