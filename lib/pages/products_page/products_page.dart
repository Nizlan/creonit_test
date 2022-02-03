import 'package:creonit_test/pages/products_page/products_bloc.dart';
import 'package:creonit_test/repositories/basket_repository.dart';
import 'package:creonit_test/repositories/products_repository.dart';
import 'package:creonit_test/widgets/appbar_bottom_widget.dart';
import 'package:creonit_test/widgets/shimmer_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsPage extends StatelessWidget {
  final int categoryId;
  const ProductsPage({Key? key, required this.categoryId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductsRepository productsRepository =
        RepositoryProvider.of<ProductsRepository>(context);
    BasketRepository basketRepository =
        RepositoryProvider.of<BasketRepository>(context);
    return BlocProvider(
      create: (context) => ProductsBloc(productsRepository, basketRepository)
        ..add(RecieveProducts(categoryId: categoryId)),
      child: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Image.asset('assets/images/back.png'),
                ),
                title: const Text('Товары'),
                bottom: const PreferredSize(
                  preferredSize: Size.fromHeight(30),
                  child: AppBarBottomWidget(),
                ),
              ),
              body: state is ProductsRecieved
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: NotificationListener<ScrollNotification>(
                        onNotification: (notification) {
                          if (context
                                  .read<ProductsBloc>()
                                  .scrollController
                                  .position
                                  .outOfRange &&
                              context
                                      .read<ProductsBloc>()
                                      .scrollController
                                      .position
                                      .userScrollDirection ==
                                  ScrollDirection.reverse) {
                            context.read<ProductsBloc>().add(UpdateEvent(
                                products: state.products,
                                basket: state.basket,
                                productIdsInBasket: state.productIdsInBasket,
                                categoryId: categoryId,
                                page: state.page));
                            return true;
                          }
                          return false;
                        },
                        child: GridView.builder(
                          controller:
                              context.read<ProductsBloc>().scrollController,
                          physics: const BouncingScrollPhysics(),
                          itemCount:
                              state.products.length + state.shimmerElements,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 20,
                            mainAxisExtent: 320,
                            crossAxisCount: 2,
                          ),
                          itemBuilder: (BuildContext ctx, index) {
                            return index < state.products.length
                                ? Column(
                                    children: [
                                      SizedBox(
                                        height: 200,
                                        child: Image.network(
                                          state.products[index].image,
                                          fit: BoxFit.fitHeight,
                                          loadingBuilder: (BuildContext context,
                                              Widget child,
                                              ImageChunkEvent?
                                                  loadingProgress) {
                                            if (loadingProgress == null) {
                                              return child;
                                            }
                                            return const ShimmerElement();
                                          },
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 12),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 6, horizontal: 8),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          color: const Color(0x1A8A8884),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              state.products[index].price
                                                      .toStringAsFixed(0) +
                                                  ' ₽',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            InkWell(
                                              onTap: () => context
                                                  .read<ProductsBloc>()
                                                  .add(UpdateBasket(
                                                      products: state.products,
                                                      basket: state.basket,
                                                      productId: state
                                                          .products[index].id,
                                                      productIdsInBasket: state
                                                          .productIdsInBasket,
                                                      page: state.page)),
                                              child: Image.asset(
                                                'assets/images/basket_product.png',
                                                height: 20,
                                                color: state.productIdsInBasket
                                                        .contains(state
                                                            .products[index].id)
                                                    ? Colors.red
                                                    : null,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: Text(
                                            state.products[index].title,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : ShimmerElement();
                          },
                        ),
                      ),
                    )
                  : const SizedBox());
        },
      ),
    );
  }
}
