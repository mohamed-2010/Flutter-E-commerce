import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myneweccomerce/bloc/product/product_bloc.dart';
import 'package:myneweccomerce/presentation/widgets/product_card.dart';

import '../../../models/models.dart';
import '../../widgets/widgets.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';

  static Route route({required Category category}) {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => CatalogScreen(category: category));
  }

  final Category category;

  const CatalogScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProducts = Product.products.where((
        product) => product.category == category.name).toList();
    return Scaffold(
      appBar: CoustomAppBarWidget(title: category.name),
      bottomNavigationBar: CoustomNavBar(),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if(state is ProductLoading){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if(state is ProductLoaded){
            final List<Product> categoryProducts = state.product
                .where((product) => product.category == category.name)
                .toList();
            return GridView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 16.0,
                ),
                itemCount: categoryProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1.15),
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: ProductCard(
                      product: categoryProducts[index],
                      widthFactor: 2.3,
                    ),
                  );
                });
          }
          else{
            return Text("Error");
          }
        },
      ),
    );
  }
}
