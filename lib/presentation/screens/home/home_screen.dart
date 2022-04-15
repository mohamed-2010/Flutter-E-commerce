import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myneweccomerce/bloc/category/category_bloc.dart';
import 'package:myneweccomerce/bloc/product/product_bloc.dart';
import 'package:myneweccomerce/models/product_model.dart';
import 'package:myneweccomerce/presentation/widgets/product_card.dart';

import '../../../models/category_model.dart';
import '../../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName), builder: (_) => HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CoustomAppBarWidget(title: "E-commerse"),
      bottomNavigationBar: CoustomNavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is CategoryLoaded) {
                  return Container(
                      child: CarouselSlider(
                    options: CarouselOptions(
                        aspectRatio: 1.8,
                        viewportFraction: 0.8,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.height),
                    items: state.category
                        .map((e) => HeroCarouselCard(category: e))
                        .toList(),
                  ));
                } else {
                  return Text("Some Thing is Ronge");
                }
              },
            ),
            SectionTitle(title: "Recomended"),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is ProductLoaded) {
                  return ProductCarousel(
                      products: state.product
                          .where((product) => product.isRecomended)
                          .toList()
                  );
                } else {
                  return Text("Some Errors");
                }
              },
            ),
            SectionTitle(title: "Most Popular"),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is ProductLoaded) {
                  return ProductCarousel(
                      products: state.product
                          .where((product) => product.isPopular)
                          .toList());
                }
                else {
                  return Text("Some Errors");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
