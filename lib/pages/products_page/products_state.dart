part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

class ProductsInitial extends ProductsState {}

class ProductsRecieved extends ProductsState {
  final List<Product> products;
  final int shimmerElements;
  final Basket basket;
  final List<int> productIdsInBasket;
  final int page;
  const ProductsRecieved({
    required this.products,
    required this.shimmerElements,
    required this.basket,
    required this.productIdsInBasket,
    required this.page,
  });
}
