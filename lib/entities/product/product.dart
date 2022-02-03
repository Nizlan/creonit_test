import 'package:creonit_test/entities/product/image/product_image.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'product_color/product_color.dart';

part 'product.g.dart';

class Product extends Equatable {
  final int id;
  final String title;
  final String slug;
  final String image;
  final double price;
  final List<ProductColor> colors;
  const Product({
    required this.id,
    required this.title,
    required this.slug,
    required this.image,
    required this.price,
    required this.colors,
  });

  @override
  List<Object> get props {
    return [
      id,
      title,
      slug,
      image,
      price,
      colors,
    ];
  }
}

@JsonSerializable()
class ProductDTO extends Equatable {
  final int id;
  final String title;
  final String slug;
  final ProductImageDTO image;
  final double price;
  final List<ProductColorDTO> colors;
  const ProductDTO({
    required this.id,
    required this.title,
    required this.slug,
    required this.image,
    required this.price,
    required this.colors,
  });

  factory ProductDTO.fromJson(Map<String, dynamic> json) =>
      _$ProductDTOFromJson(json);

  Product toProduct() {
    return Product(
        id: id,
        title: title,
        slug: slug,
        image: image.file.url,
        price: price,
        colors: colors.map((e) => e.toProductColor()).toList());
  }

  @override
  List<Object> get props {
    return [
      id,
      title,
      slug,
      image,
      price,
      colors,
    ];
  }
}
