import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lon_stores/src/config/routes/app_router.gr.dart';
import 'package:lon_stores/src/config/theme/app_color.dart';
import 'package:lon_stores/src/core/utils/const/dummy.dart';
import 'package:lon_stores/src/core/utils/const/product_categories.dart';
import 'package:lon_stores/src/core/utils/extension/widget_extension.dart/gesture_extension.dart';
import 'package:lon_stores/src/features/home/data/controller/get_product_by_cat.dart';
import 'package:lon_stores/src/features/home/presentation/widget/product_grid.dart';

final _selectedIndex = StateProvider((ref) => 0);

@RoutePage()
class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final textTheme = Theme.of(context).textTheme;
    final selectedIndex = ref.watch(_selectedIndex);
    final pageController = usePageController(initialPage: 0);
    final getProductByCategory = ref.watch(
      getProductByCategoryWithLimit(categories[selectedIndex].category),
    );

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(Dummy.profileImage),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome,",
                            style: textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            "Sarah Jakes",
                            style: textTheme.bodyMedium?.copyWith(),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/images/icons/notification.png',
                    height: 24,
                    width: 24,
                  ),
                ],
              ),
              Container(
                height: 50,
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.black12,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/icons/search.png',
                      height: 24,
                      width: 24,
                    ),
                    const Text('search')
                  ],
                ),
              ).onTap(() {
                context.pushRoute(const SearchRoute());
              }),
              Text("Categories",
                  style: textTheme.headlineLarge?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                height: 50,
                child: ListView.builder(
                    itemCount: categories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final bool isSelected = index == selectedIndex;
                      return Container(
                        width: 90,
                        margin: const EdgeInsets.all(8),
                        decoration: isSelected
                            ? BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: AppColors.primaryColor,
                              )
                            : BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white,
                                border: Border.all(
                                  width: 0.5,
                                  color: Colors.black,
                                ),
                              ),
                        child: Center(
                          child: Text(
                            categories[index].categories.name,
                            textAlign: TextAlign.center,
                            style: textTheme.bodyMedium?.copyWith(
                              color: isSelected ? Colors.white : null,
                            ),
                          ),
                        ).onTap(() {
                          ref.read(_selectedIndex.notifier).state = index;
                          // pageController.animateToPage(
                          //   selectedIndex,
                          //   duration: const Duration(milliseconds: 400),
                          //   curve: Curves.easeIn,
                          // );
                          pageController.jumpToPage(index);
                        }),
                      );
                    }),
              ),
              getProductByCategory.when(
                error: (_, e) => Center(child: Text(e.toString())),
                loading: () => const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      CircularProgressIndicator(),
                    ],
                  ),
                ),
                data: (products) {
                  return Expanded(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(),
                            TextButton(
                              onPressed: () {
                                context.pushRoute(
                                  AllProductRoute(
                                    category:
                                        categories[selectedIndex].category,
                                  ),
                                );
                              },
                              child: Text(
                                'See all',
                                style: textTheme.bodyMedium?.copyWith(
                                  fontSize: 14,
                                  color: AppColors.lightBrownColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: PageView.builder(
                            itemCount: categories.length,
                            controller: pageController,

                            physics: const NeverScrollableScrollPhysics(),

                            // onPageChanged: (value) =>
                            //     ref.read(_selectedIndex.notifier).state = value,
                            itemBuilder: (context, index) {
                              return ProductGrid(
                                products: products,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
