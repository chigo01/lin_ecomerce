import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lon_stores/src/config/theme/app_color.dart';
import 'package:lon_stores/src/core/utils/const/icons.dart';
import 'package:lon_stores/src/core/utils/extension/widget_extension.dart/gesture_extension.dart';
import 'package:lon_stores/src/features/product/data/controller/product_detail_controller.dart';

@RoutePage()
class ProductDetailPage extends HookConsumerWidget {
  const ProductDetailPage({
    super.key,
    required this.productId,
  });
  final int productId;

  @override
  Widget build(BuildContext context, ref) {
    final textTheme = Theme.of(context).textTheme;
    final product = ref.watch(getProduct(productId));
    return Scaffold(
      body: product.when(
        error: (_, e) => Center(child: Text(e.toString())),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        data: (product) {
          return SafeArea(
            child: Scaffold(
              bottomNavigationBar: Container(
                height: 100,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Column(
                      children: [
                        Text('Total Price'),
                        Text(
                          '\$120.00',
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 16,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          AppIcons.cartIcon(),
                          const SizedBox(width: 5),
                          Text(
                            'Add to Cart',
                            style: textTheme.bodyMedium?.copyWith(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              body: Column(
                children: [
                  Stack(
                    children: [
                      Image.network(
                        product.image,
                        height: 300,
                        width: MediaQuery.sizeOf(context).width,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(left: 15, top: 15),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.white,
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                          size: 20,
                        ),
                      ).onTap(() {
                        context.popRoute();
                      }),
                    ],
                  ),
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 15),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              product.category,
                              style: textTheme.bodyMedium?.copyWith(
                                color: AppColors.darkGrayColor,
                                fontSize: 16,
                              ),
                            ),
                            Row(
                              children: [
                                AppIcons.starIcon(),
                                const SizedBox(width: 4),
                                Text(
                                  product.rating.rate.toString(),
                                  style: textTheme.bodyMedium?.copyWith(
                                    color: AppColors.darkGrayColor,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 15),
                        Text(
                          product.title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Product Detail',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          product.description,
                          style: textTheme.bodySmall?.copyWith(
                            color: AppColors.darkGrayColor,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 50),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
