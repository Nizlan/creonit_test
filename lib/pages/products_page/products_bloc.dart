import 'package:bloc/bloc.dart';
import 'package:creonit_test/entities/basket/basket.dart';
import 'package:creonit_test/repositories/basket_repository.dart';
import 'package:creonit_test/widgets/shimmer_element.dart';
import 'package:flutter/material.dart';
import '/entities/product/product.dart';
import '/repositories/products_repository.dart';
import 'package:equatable/equatable.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ScrollController scrollController = ScrollController();
  ProductsRepository productsRepository;
  BasketRepository basketRepository;
  ProductsBloc(this.productsRepository, this.basketRepository)
      : super(ProductsInitial()) {
    on<RecieveProducts>((event, emit) async {
      Basket basket = await basketRepository.getBasket('');
      List<Product> products =
          await productsRepository.getProducts(event.categoryId, 1);
      List<int> productIdsInBasket =
          basket.items.map((e) => e.productId).toList();
      emit(ProductsRecieved(
          products: products,
          shimmerElements: 0,
          basket: basket,
          productIdsInBasket: productIdsInBasket,
          page: 1));
    });
    on<UpdateEvent>((event, emit) async {
      emit(ProductsInitial());
      emit(ProductsRecieved(
          products: event.products,
          shimmerElements: 4,
          basket: event.basket,
          productIdsInBasket: event.productIdsInBasket,
          page: event.page));
      int page = event.page + 1;
      List<Product> products = event.products +
          await productsRepository.getProducts(event.categoryId, page);
      emit(ProductsInitial());
      emit(ProductsRecieved(
          products: products,
          shimmerElements: 0,
          basket: event.basket,
          productIdsInBasket: event.productIdsInBasket,
          page: page));
    });
    on<UpdateBasket>((event, emit) async {
      Basket basket = event.basket;
      if (event.productIdsInBasket.contains(event.productId)) {
        await basketRepository.deleteFromBasket(
            event.basket.user.accessKey, event.productId);
        basket.items
            .removeWhere((element) => element.productId == event.productId);
      } else {
        await basketRepository.addToBasket(
            basket.user.accessKey, event.productId);
        basket.items.add(BasketItem(quantity: 1, productId: event.productId));
      }
      List<int> productIdsInBasket =
          basket.items.map((e) => e.productId).toList();
      emit(ProductsInitial());
      emit(ProductsRecieved(
          products: event.products,
          shimmerElements: 0,
          basket: basket,
          productIdsInBasket: productIdsInBasket,
          page: event.page));
    });
  }
}
