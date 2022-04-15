import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/models.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<CartStarted>(_onStartWishlist);
    on<CartProductAdded>(_onAddProductCard);
    on<CartProductRemoved>(_onRemoveProductCard);
  }
  static List<Product> products = [];

  void _onStartWishlist(
      CartStarted event,
      Emitter<CartState> emit,
      ) async {
    emit(CartLoading());
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(
        CartLoaded(
          cart: Cart(products: products),
        ),
      );
    } catch (_) {
      emit(CartError());
    }
  }

  void _onAddProductCard(
      CartProductAdded event,
      Emitter<CartState> emit,
      ) async {
    if(this.state is CartLoaded){
        try{
          emit(
            CartLoaded(
            cart: Cart(
              products:
                List.from((this.state as CartLoaded).cart.products)
                  ..add(event.product)
            )
            )
          );
        }catch (_){}
      }
  }

  void _onRemoveProductCard(
      CartProductRemoved event,
      Emitter<CartState> emit,
      ) async {
    if(this.state is CartLoaded){
      try{
        emit(
            CartLoaded(
                cart: Cart(
                    products:
                    List.from((this.state as CartLoaded).cart.products)
                      ..remove(event.product)
                )
            )
        );
      }catch (_){}
    }
  }

}
