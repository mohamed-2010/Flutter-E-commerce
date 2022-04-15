import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myneweccomerce/bloc/cart/cart_bloc.dart';
import 'package:myneweccomerce/models/cart_model.dart';
import 'package:myneweccomerce/models/models.dart';

import '../../widgets/widgets.dart';
class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  static const String routeName = '/cart';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName), builder: (_) => CartScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CoustomAppBarWidget(title: "Cart"),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/checkout');
                },
                child: Text(
                  "Check Out",
                  style: Theme.of(context).textTheme.headline3,
                ),
                style: ElevatedButton.styleFrom(primary: Colors.white),
              )
            ],
          ),
        ),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if(state is CartLoading){
            return Center(child: CircularProgressIndicator(),);
          }
          if(state is CartLoaded){
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          state.cart.freeDeliveryString,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/');
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                            shape: RoundedRectangleBorder(),
                            elevation: 0,
                          ),
                          child: Text(
                            'Add More Items',
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      height: 400,
                      child: ListView.builder(
                        itemCount: state.cart.ProductQuantity(state.cart.products).keys.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CartProductCard(
                            product: state.cart.ProductQuantity(state.cart.products).keys.elementAt(index),
                            quantity: state.cart.ProductQuantity(state.cart.products).values.elementAt(index)
                          );
                        },
                      ),
                    ),
                    Column(
                      children: [
                        Divider(thickness: 2),
                        Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('SUBTOTAL',
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .headline5),
                              Text('\$${state.cart.subtotal}',
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .headline5),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('DELIVERY FEE',
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .headline5),
                              Text('\$${state.cart.deliveryFeeString}',
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .headline5),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Stack(
                          children: <Widget>[
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              height: 60,
                              alignment: Alignment.bottomCenter,
                              decoration: BoxDecoration(
                                color: Colors.black.withAlpha(50),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(5.0),
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width - 10,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.black,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'TOTAL',
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .headline5!
                                          .copyWith(color: Colors.white),
                                    ),
                                    Text(
                                      '\$${state.cart.totalString}',
                                      style: Theme
                                          .of(context)
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
                      ],
                    )
                  ],
                ),
              ),
            );
          }else{
            return Center(child: Text("Some Thing Is Ronge"),);
          }
        },
      ),
    );
  }
}
