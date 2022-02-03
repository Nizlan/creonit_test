import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_color.g.dart';

class ProductColor extends Equatable {
  final int id;
  final String title;
  final String code;
  const ProductColor({
    required this.id,
    required this.title,
    required this.code,
  });

  @override
  List<Object> get props => [id, title, code];
}

@JsonSerializable()
class ProductColorDTO extends Equatable {
  final int id;
  final String title;
  final String code;
  const ProductColorDTO({
    required this.id,
    required this.title,
    required this.code,
  });

  factory ProductColorDTO.fromJson(Map<String, dynamic> json) =>
      _$ProductColorDTOFromJson(json);

  ProductColor toProductColor() {
    return ProductColor(id: id, title: title, code: code);
  }

  @override
  List<Object> get props => [id, title, code];
}
