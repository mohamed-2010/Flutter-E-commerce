import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myneweccomerce/models/category_model.dart';
import 'package:myneweccomerce/models/models.dart';
import 'package:myneweccomerce/presentation/screens/cart/cart_screen.dart';
import 'package:myneweccomerce/presentation/screens/catalog/catalog_screen.dart';
import 'package:myneweccomerce/presentation/screens/checkout/checkout_screen.dart';
import 'package:myneweccomerce/presentation/screens/home/home_screen.dart';
import 'package:myneweccomerce/presentation/screens/mywishes/mywishes_screen.dart';
import 'package:myneweccomerce/presentation/screens/product/product_screen.dart';
import 'package:myneweccomerce/presentation/screens/profile/profile_screen.dart';
String? rout;
class AppRouter{
  static Route onGenerateRoute(RouteSettings settings) {
    print('this is route: ${settings.name}');
    rout = settings.name;

    switch (settings.name){
      case '/':
        return HomeScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case ProfileScreen.routeName:
        return ProfileScreen.route();
      case MyWishesScreen.routeName:
        return MyWishesScreen.route();
      case ProductScreen.routeName:
        return ProductScreen.route(product: settings.arguments as Product);
      case CatalogScreen.routeName:
        return CatalogScreen.route(category: settings.arguments as Category);
      case CheckOutScreen.routeName:
        return CheckOutScreen.route();
      default:
        return _errorRoute();
    }
  }
  static Route _errorRoute(){
    return MaterialPageRoute(
        settings: RouteSettings(name: '/error'),
        builder: (_) => Scaffold(appBar: AppBar(title:Text("error")),));
  }
}