part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

class RecieveProducts extends ProductsEvent {
  final int categoryId;
  const RecieveProducts({
    required this.categoryId,
  });
}

class UpdateEvent extends ProductsEvent {
  final List<Product> products;
  final Basket basket;
  final List<int> productIdsInBasket;
  final int categoryId;
  final int page;
  const UpdateEvent({
    required this.products,
    required this.basket,
    required this.productIdsInBasket,
    required this.categoryId,
    required this.page,
  });
}

class UpdateBasket extends ProductsEvent {
  final List<Product> products;
  final Basket basket;
  final List<int> productIdsInBasket;
  final int productId;
  final int page;
  const UpdateBasket({
    required this.products,
    required this.basket,
    required this.productIdsInBasket,
    required this.productId,
    required this.page,
  });
}
