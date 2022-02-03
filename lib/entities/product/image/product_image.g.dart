// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductImageDTO _$ProductImageDTOFromJson(Map<String, dynamic> json) =>
    ProductImageDTO(
      file: ImageFile.fromJson(json['file'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductImageDTOToJson(ProductImageDTO instance) =>
    <String, dynamic>{
      'file': instance.file,
    };

ImageFile _$ImageFileFromJson(Map<String, dynamic> json) => ImageFile(
      url: json['url'] as String,
      extension: json['extension'] as String,
    );

Map<String, dynamic> _$ImageFileToJson(ImageFile instance) => <String, dynamic>{
      'url': instance.url,
      'extension': instance.extension,
    };
