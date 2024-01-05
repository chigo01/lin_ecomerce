// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;
import 'package:lon_stores/src/features/cart/presentation/cart.dart' as _i2;
import 'package:lon_stores/src/features/home/presentation/all_product_page.dart'
    as _i1;
import 'package:lon_stores/src/features/home/presentation/home_page.dart'
    as _i5;
import 'package:lon_stores/src/features/lin_stores.dart' as _i3;
import 'package:lon_stores/src/features/product/presentation/product_detail_screen.dart'
    as _i6;
import 'package:lon_stores/src/features/search/presentation/filter_screen.dart'
    as _i4;
import 'package:lon_stores/src/features/search/presentation/search_screen.dart'
    as _i7;
import 'package:lon_stores/src/features/user/presentation/user_page.dart'
    as _i8;

abstract class $AppRouter extends _i9.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    AllProductRoute.name: (routeData) {
      final args = routeData.argsAs<AllProductRouteArgs>();
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AllProductPage(
          args.category,
          key: args.key,
        ),
      );
    },
    CartRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.CartPage(),
      );
    },
    CustomerRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.CustomerPage(),
      );
    },
    FilterRoute.name: (routeData) {
      final args = routeData.argsAs<FilterRouteArgs>();
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.FilterPage(
          key: args.key,
          search: args.search,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.HomePage(),
      );
    },
    ProductDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ProductDetailRouteArgs>();
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.ProductDetailPage(
          key: args.key,
          productId: args.productId,
        ),
      );
    },
    SearchRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.SearchPage(),
      );
    },
    UserRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.UserPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AllProductPage]
class AllProductRoute extends _i9.PageRouteInfo<AllProductRouteArgs> {
  AllProductRoute({
    required String category,
    _i10.Key? key,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          AllProductRoute.name,
          args: AllProductRouteArgs(
            category: category,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AllProductRoute';

  static const _i9.PageInfo<AllProductRouteArgs> page =
      _i9.PageInfo<AllProductRouteArgs>(name);
}

class AllProductRouteArgs {
  const AllProductRouteArgs({
    required this.category,
    this.key,
  });

  final String category;

  final _i10.Key? key;

  @override
  String toString() {
    return 'AllProductRouteArgs{category: $category, key: $key}';
  }
}

/// generated route for
/// [_i2.CartPage]
class CartRoute extends _i9.PageRouteInfo<void> {
  const CartRoute({List<_i9.PageRouteInfo>? children})
      : super(
          CartRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i3.CustomerPage]
class CustomerRoute extends _i9.PageRouteInfo<void> {
  const CustomerRoute({List<_i9.PageRouteInfo>? children})
      : super(
          CustomerRoute.name,
          initialChildren: children,
        );

  static const String name = 'CustomerRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i4.FilterPage]
class FilterRoute extends _i9.PageRouteInfo<FilterRouteArgs> {
  FilterRoute({
    _i10.Key? key,
    required String search,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          FilterRoute.name,
          args: FilterRouteArgs(
            key: key,
            search: search,
          ),
          initialChildren: children,
        );

  static const String name = 'FilterRoute';

  static const _i9.PageInfo<FilterRouteArgs> page =
      _i9.PageInfo<FilterRouteArgs>(name);
}

class FilterRouteArgs {
  const FilterRouteArgs({
    this.key,
    required this.search,
  });

  final _i10.Key? key;

  final String search;

  @override
  String toString() {
    return 'FilterRouteArgs{key: $key, search: $search}';
  }
}

/// generated route for
/// [_i5.HomePage]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute({List<_i9.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ProductDetailPage]
class ProductDetailRoute extends _i9.PageRouteInfo<ProductDetailRouteArgs> {
  ProductDetailRoute({
    _i10.Key? key,
    required int productId,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          ProductDetailRoute.name,
          args: ProductDetailRouteArgs(
            key: key,
            productId: productId,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductDetailRoute';

  static const _i9.PageInfo<ProductDetailRouteArgs> page =
      _i9.PageInfo<ProductDetailRouteArgs>(name);
}

class ProductDetailRouteArgs {
  const ProductDetailRouteArgs({
    this.key,
    required this.productId,
  });

  final _i10.Key? key;

  final int productId;

  @override
  String toString() {
    return 'ProductDetailRouteArgs{key: $key, productId: $productId}';
  }
}

/// generated route for
/// [_i7.SearchPage]
class SearchRoute extends _i9.PageRouteInfo<void> {
  const SearchRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i8.UserPage]
class UserRoute extends _i9.PageRouteInfo<void> {
  const UserRoute({List<_i9.PageRouteInfo>? children})
      : super(
          UserRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}
