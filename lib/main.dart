import 'package:creonit_test/pages/categories_page/categories_bloc.dart';
import 'package:creonit_test/repositories/basket_repository.dart';
import 'package:creonit_test/repositories/categories_repository.dart';
import 'package:creonit_test/repositories/products_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/pages/main_page/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<CategoriesRepository>(
          create: (context) => CategoriesRepository(),
        ),
        RepositoryProvider<ProductsRepository>(
          create: (context) => ProductsRepository(),
        ),
        RepositoryProvider<BasketRepository>(
          create: (context) => BasketRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<CategoriesBloc>(
            create: (BuildContext context) =>
                CategoriesBloc(CategoriesRepository())
                  ..add(RecieveCategories()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                  iconTheme: IconThemeData(
                    color: Colors.black, //change your color here
                  ),
                  centerTitle: true,
                  titleTextStyle: TextStyle(color: Colors.black, fontSize: 18),
                  backgroundColor: Colors.white,
                  elevation: 0)),
          home: const MainPage(),
        ),
      ),
    );
  }
}
