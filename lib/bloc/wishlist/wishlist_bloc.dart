import 'dart:async';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../models/models.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc()
      :super(WishlistLoading()) {
    on<StartWishlist>(_onStartWishlist);
    on<AddProductToWishlist>(_onAddProductToWishlist);
    on<RemoveProductFromWishlist>(_onRemoveProductFromWishlist);
  }

  static List<Product> products = [];

  void _onStartWishlist(
      StartWishlist event,
      Emitter<WishlistState> emit,
      ) async {
    emit(WishlistLoading());
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(
        WishlistLoaded(
          wishlist: WishList(products: products),
        ),
      );
    } catch (_) {
      emit(WishlistError());
    }
  }

  void _onAddProductToWishlist(
      AddProductToWishlist event,
      Emitter<WishlistState> emit,
      ) async {
    if (this.state is WishlistLoaded) {
      try {
        emit(
          WishlistLoaded(
            wishlist: WishList(
              products:
              List.from((this.state as WishlistLoaded).wishlist.products)
                ..add(event.product),
            ),
          ),
        );
      } on Exception {
        emit(WishlistError());
      }
    }
  }

  void _onRemoveProductFromWishlist(
      RemoveProductFromWishlist event,
      Emitter<WishlistState> emit,
      ) async {
    if (this.state is WishlistLoaded) {
      try {
        emit(
          WishlistLoaded(
            wishlist: WishList(
              products:
              List.from((this.state as WishlistLoaded).wishlist.products)
                ..remove(event.product),
            ),
          ),
        );
      } on Exception {
        emit(WishlistError());
      }
    }
  }
}