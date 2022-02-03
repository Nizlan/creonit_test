// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDTO _$ProductDTOFromJson(Map<String, dynamic> json) => ProductDTO(
      id: json['id'] as int,
      title: json['title'] as String,
      slug: json['slug'] as String,
      image: ProductImageDTO.fromJson(json['image'] as Map<String, dynamic>),
      price: (json['price'] as num).toDouble(),
      colors: (json['colors'] as List<dynamic>)
          .map((e) => ProductColorDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductDTOToJson(ProductDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'image': instance.image,
      'price': instance.price,
      'colors': instance.colors,
    };
