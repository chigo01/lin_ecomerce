import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lon_stores/src/DTO/product_model.dart';
import 'package:lon_stores/src/config/routes/app_router.gr.dart';
import 'package:lon_stores/src/config/theme/app_color.dart';
import 'package:lon_stores/src/core/utils/extension/widget_extension.dart/gesture_extension.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({
    super.key,
    required this.products,
  });

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GridView.builder(
      itemCount: products.length,
      padding: const EdgeInsets.all(5),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        mainAxisExtent: 350,
      ),
      itemBuilder: (context, index) {
        final product = products[index];
        return Container(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  product.image,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 18),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    product.title,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 16,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    product.category,
                    style: textTheme.bodyMedium?.copyWith(
                      color: AppColors.darkGrayColor,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '\$${product.price}',
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 16,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
        ).onTap(() {
          context.pushRoute(
            ProductDetailRoute(productId: product.id),
          );
        });
      },
    );
  }
}
