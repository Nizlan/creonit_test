import 'package:creonit_test/pages/products_page/products_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'categories_bloc.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<CategoriesBloc>(context),
      child: BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) {
          return state is CategoriesRecieved
              ? Scaffold(
                  appBar: AppBar(
                    title: const Text('Категории'),
                    bottom: PreferredSize(
                        child: Container(
                          color: const Color(0x408A8884),
                          height: 0.8,
                        ),
                        preferredSize: const Size.fromHeight(0.8)),
                  ),
                  body: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.categories.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductsPage(
                                    categoryId: state.categories[index].id))),
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: const BoxDecoration(
                              border: Border(
                            bottom: BorderSide(
                              color: Color(0x408A8884),
                              width: 1.0,
                            ),
                          )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(state.categories[index].title),
                              Image.asset('assets/images/arrow right.png')
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              : const Center(child: Text('Загрузка...'));
        },
      ),
    );
  }
}
