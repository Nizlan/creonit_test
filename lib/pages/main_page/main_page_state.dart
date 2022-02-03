part of 'main_page_bloc.dart';

@immutable
abstract class MainPageState {}

class MainPageInitial extends MainPageState {
  final int selectedIndex;
  MainPageInitial({
    required this.selectedIndex,
  });
}
