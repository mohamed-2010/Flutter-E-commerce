import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myneweccomerce/bloc/cart/cart_bloc.dart';
import 'package:myneweccomerce/bloc/category/category_bloc.dart';
import 'package:myneweccomerce/bloc/product/product_bloc.dart';
import 'package:myneweccomerce/bloc/wishlist/wishlist_bloc.dart';
import 'package:myneweccomerce/config/app_router.dart';
import 'package:myneweccomerce/config/theme.dart';
import 'package:myneweccomerce/repositories/category/category_repository.dart';
import 'package:myneweccomerce/repositories/checkout/checkout_repository.dart';
import 'package:myneweccomerce/repositories/product/product_repository.dart';

import 'bloc/checkout/checkout_bloc.dart';
import 'presentation/screens/screens.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
        BlocProvider(create: (_) => CartBloc()..add(CartStarted())),
        BlocProvider(
          create: (context) => CheckoutBloc(
            cartBloc: context.read<CartBloc>(),
            checkoutRepository: CheckoutRepository(),
          ),
        ),
        BlocProvider(create: (_) => WishlistBloc()..add(StartWishlist())),
        BlocProvider(create: (_) => CategoryBloc(categoryRepository: CategoryRepository())..add(LoadCategories())),
        BlocProvider(create: (_) => ProductBloc(productRepository: ProductRepository())..add(LoadProductes()),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: HomeScreen.routeName,
      ),
    );
  }
}