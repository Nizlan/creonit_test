part of 'categories_bloc.dart';

abstract class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [];
}

class CategoriesInitial extends CategoriesState {}

class CategoriesRecieved extends CategoriesState {
  final List<Category> categories;
  const CategoriesRecieved({required this.categories});
}
