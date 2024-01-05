import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lon_stores/src/features/home/data/controller/get_product_by_cat.dart';
import 'package:lon_stores/src/features/home/presentation/widget/product_grid.dart';

@RoutePage()
class AllProductPage extends HookConsumerWidget {
  const AllProductPage(this.category, {super.key});
  final String category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(getAllProductByCategory(category));
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: products.when(
        error: (_, e) => Center(child: Text(e.toString())),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        data: (product) {
          return ProductGrid(
            products: product,
          );
        },
      ),
    );
  }
}
