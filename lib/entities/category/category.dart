import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs

class Category extends Equatable {
  final int id;
  final String title;
  final String slug;

  const Category({
    required this.id,
    required this.title,
    required this.slug,
  });

  @override
  List<Object> get props => [id, title, slug];
}

@JsonSerializable()
class CategoryDTO extends Equatable {
  final int id;
  final String title;
  final String slug;

  const CategoryDTO({
    required this.id,
    required this.title,
    required this.slug,
  });

  factory CategoryDTO.fromJson(Map<String, dynamic> json) =>
      _$CategoryDTOFromJson(json);

  Category toCategory() {
    return Category(id: id, title: title, slug: slug);
  }

  @override
  List<Object> get props => [id, title, slug];
}
