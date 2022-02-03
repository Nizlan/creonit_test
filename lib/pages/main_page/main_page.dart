import 'package:creonit_test/pages/categories_page/categories_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'main_page_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainPageBloc(),
      child: BlocBuilder<MainPageBloc, MainPageState>(
        builder: (context, state) {
          return state is MainPageInitial
              ? WillPopScope(
                  onWillPop: () async {
                    final isFirstRouteInCurrentTab =
                        !await widgets[state.selectedIndex]
                            .key
                            .currentState!
                            .maybePop();
                    if (isFirstRouteInCurrentTab) {
                      if (state.selectedIndex != 0) {
                        context.read<MainPageBloc>().add(SelectTab(
                            index: 0, selectedIndex: state.selectedIndex));
                        return false;
                      }
                    }
                    return isFirstRouteInCurrentTab;
                  },
                  child: Scaffold(
                    body: IndexedStack(
                        index: state.selectedIndex,
                        children: widgets
                            .map(
                              (e) => Navigator(
                                key: e.key,
                                onGenerateRoute: (routeSettings) {
                                  return MaterialPageRoute(
                                    builder: (_) => e.page,
                                  );
                                },
                              ),
                            )
                            .toList()),
                    bottomNavigationBar: BottomNavigationBar(
                      backgroundColor: Colors.white,
                      elevation: 0,
                      showUnselectedLabels: false,
                      type: BottomNavigationBarType.fixed,
                      showSelectedLabels: false,
                      items: items,
                      currentIndex: state.selectedIndex,
                      onTap: (index) => context
                          .read<MainPageBloc>()
                          .add(OnItemTapped(index: index)),
                    ),
                  ),
                )
              : const SizedBox();
        },
      ),
    );
  }
}
