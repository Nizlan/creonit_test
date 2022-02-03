import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:creonit_test/entities/product/product.dart';

part 'basket.g.dart';

class Basket extends Equatable {
  final int id;
  final List<BasketItem> items;
  final BasketUser user;
  const Basket({
    required this.id,
    required this.items,
    required this.user,
  });

  @override
  List<Object> get props => [id, items, user];
}

@JsonSerializable()
class BasketDTO extends Equatable {
  final int id;
  final List<BasketItemDTO> items;
  final BasketUserDTO user;
  const BasketDTO({
    required this.id,
    required this.items,
    required this.user,
  });

  factory BasketDTO.fromJson(Map<String, dynamic> json) =>
      _$BasketDTOFromJson(json);

  Basket toBasket() {
    return Basket(
        id: id,
        items: items.map((e) => e.toBasketUser()).toList(),
        user: user.toBasketUser());
  }

  @override
  List<Object> get props => [id, items, user];
}

class BasketItem extends Equatable {
  final int quantity;
  final int productId;
  const BasketItem({
    required this.quantity,
    required this.productId,
  });

  @override
  List<Object> get props => [quantity, productId];
}

@JsonSerializable()
class BasketItemDTO extends Equatable {
  final int quantity;
  final ProductDTO product;
  const BasketItemDTO({
    required this.quantity,
    required this.product,
  });

  factory BasketItemDTO.fromJson(Map<String, dynamic> json) =>
      _$BasketItemDTOFromJson(json);

  BasketItem toBasketUser() {
    return BasketItem(quantity: quantity, productId: product.id);
  }

  @override
  List<Object> get props => [quantity, product];
}

class BasketUser extends Equatable {
  final int id;
  final String accessKey;
  const BasketUser({
    required this.id,
    required this.accessKey,
  });

  @override
  List<Object> get props => [id, accessKey];
}

@JsonSerializable()
class BasketUserDTO extends Equatable {
  final int id;
  final String accessKey;
  const BasketUserDTO({
    required this.id,
    required this.accessKey,
  });

  factory BasketUserDTO.fromJson(Map<String, dynamic> json) =>
      _$BasketUserDTOFromJson(json);

  BasketUser toBasketUser() {
    return BasketUser(id: id, accessKey: accessKey);
  }

  @override
  List<Object> get props => [id, accessKey];
}
