// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasketDTO _$BasketDTOFromJson(Map<String, dynamic> json) => BasketDTO(
      id: json['id'] as int,
      items: (json['items'] as List<dynamic>)
          .map((e) => BasketItemDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      user: BasketUserDTO.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BasketDTOToJson(BasketDTO instance) => <String, dynamic>{
      'id': instance.id,
      'items': instance.items,
      'user': instance.user,
    };

BasketItemDTO _$BasketItemDTOFromJson(Map<String, dynamic> json) =>
    BasketItemDTO(
      quantity: json['quantity'] as int,
      product: ProductDTO.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BasketItemDTOToJson(BasketItemDTO instance) =>
    <String, dynamic>{
      'quantity': instance.quantity,
      'product': instance.product,
    };

BasketUserDTO _$BasketUserDTOFromJson(Map<String, dynamic> json) =>
    BasketUserDTO(
      id: json['id'] as int,
      accessKey: json['accessKey'] as String,
    );

Map<String, dynamic> _$BasketUserDTOToJson(BasketUserDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'accessKey': instance.accessKey,
    };
