import 'package:bloc/bloc.dart';
import 'package:creonit_test/entities/basket/basket.dart';
import 'package:creonit_test/repositories/basket_repository.dart';
import '/repositories/categories_repository.dart';
import '/entities/category/category.dart';
import 'package:equatable/equatable.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesRepository categoriesRepository;
  CategoriesBloc(this.categoriesRepository) : super(CategoriesInitial()) {
    on<RecieveCategories>((event, emit) async {
      List<Category> categories = await categoriesRepository.getCategories();
      emit(CategoriesRecieved(categories: categories));
    });
  }
}
