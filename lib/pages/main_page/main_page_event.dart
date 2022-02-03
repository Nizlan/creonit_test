part of 'main_page_bloc.dart';

@immutable
abstract class MainPageEvent {}

class OnItemTapped extends MainPageEvent {
  final int index;
  OnItemTapped({
    required this.index,
  });
}

class SelectTab extends MainPageEvent {
  final int index;
  final int selectedIndex;
  SelectTab({required this.index, required this.selectedIndex});
}
