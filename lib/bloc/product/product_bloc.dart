import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myneweccomerce/repositories/product/product_repository.dart';

import '../../models/models.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;
  StreamSubscription? _productSubscription;

  ProductBloc({required ProductRepository productRepository}) :
      _productRepository = productRepository,
        super(ProductLoading()) {
   on<LoadProductes>(_onLoadProductes);
   on<UpdateProducts>(_onUpdateCategories);

  }
  void _onLoadProductes(
      LoadProductes event,
      Emitter<ProductState> emit,
      ) {
    _productSubscription?.cancel();
    _productSubscription = _productRepository.getAllProducts().listen(
          (products) => add(
        UpdateProducts(products),
      ),
    );
  }

  void _onUpdateCategories(
      UpdateProducts event,
      Emitter<ProductState> emit,
      ) {
    emit(
      ProductLoaded(product: event.products),
    );
  }
}
