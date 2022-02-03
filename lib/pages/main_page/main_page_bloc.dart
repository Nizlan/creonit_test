import 'package:bloc/bloc.dart';
import 'package:creonit_test/entities/tab_item/tab_item.dart';
import 'package:flutter_svg/svg.dart';
import '/pages/categories_page/categories_page.dart';
import 'package:flutter/material.dart';
part 'main_page_event.dart';
part 'main_page_state.dart';

List<BottomNavigationBarItem> items = [
  BottomNavigationBarItem(
    icon: SvgPicture.asset("assets/images/main_page.svg"),
    activeIcon: SvgPicture.asset('assets/images/main_page_selected.svg'),
    label: 'Главная',
  ),
  BottomNavigationBarItem(
    icon: SvgPicture.asset("assets/images/catalog.svg"),
    activeIcon: SvgPicture.asset("assets/images/catalog_selected.svg"),
    label: 'Каталог',
  ),
  BottomNavigationBarItem(
    icon: SvgPicture.asset("assets/images/favorites.svg"),
    activeIcon: SvgPicture.asset("assets/images/favorites_selected.svg"),
    label: 'Избранное',
  ),
  BottomNavigationBarItem(
    icon: SvgPicture.asset("assets/images/basket.svg"),
    activeIcon: SvgPicture.asset("assets/images/basket_selected.svg"),
    label: 'Корзина',
  ),
  BottomNavigationBarItem(
    icon: SvgPicture.asset("assets/images/profile.svg"),
    activeIcon: SvgPicture.asset("assets/images/profile_selected.svg"),
    label: 'Профиль',
  ),
];

List<TabItem> widgets = List.generate(
    items.length,
    (index) => index != 1
        ? TabItem(
            page:
                Center(child: Text('Экран ${items[index].label} в разработке')))
        : TabItem(page: const CategoriesPage()));

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  MainPageBloc() : super(MainPageInitial(selectedIndex: 0)) {
    on<OnItemTapped>((event, emit) {
      emit(MainPageInitial(selectedIndex: event.index));
    });
    on<SelectTab>((event, emit) {
      if (event.index == event.selectedIndex) {
        widgets[event.index]
            .key
            .currentState!
            .popUntil((route) => route.isFirst);
      } else {
        emit(MainPageInitial(selectedIndex: event.index));
      }
    });
  }
}
