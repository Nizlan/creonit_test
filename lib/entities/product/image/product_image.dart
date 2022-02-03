import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_image.g.dart';

class ProductImage extends Equatable {
  final String url;
  final String extension;
  const ProductImage({
    required this.url,
    required this.extension,
  });

  @override
  List<Object> get props => [url, extension];
}

@JsonSerializable()
class ProductImageDTO extends Equatable {
  final ImageFile file;
  const ProductImageDTO({
    required this.file,
  });

  factory ProductImageDTO.fromJson(Map<String, dynamic> json) =>
      _$ProductImageDTOFromJson(json);

  ProductImage toProductImage() {
    return ProductImage(url: file.url, extension: file.extension);
  }

  @override
  List<Object> get props => [file];
}

@JsonSerializable()
class ImageFile extends Equatable {
  final String url;
  final String extension;
  const ImageFile({
    required this.url,
    required this.extension,
  });

  factory ImageFile.fromJson(Map<String, dynamic> json) =>
      _$ImageFileFromJson(json);

  @override
  List<Object> get props => [url, extension];
}
