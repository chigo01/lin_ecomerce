import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lon_stores/src/DTO/product_model.dart';
import 'package:lon_stores/src/features/home/data/repository/home_services.dart';

final homeRepo = Provider((ref) => HomeRepository());
final getProductByCategoryWithLimit =
    FutureProvider.autoDispose.family<List<Product>, String>(
  (ref, category) async {
    final products = ref.read(homeRepo);
    return products.getCategoryWithLimit(category);
  },
);
final getAllProductByCategory =
    FutureProvider.autoDispose.family<List<Product>, String>(
  (ref, category) async {
    final products = ref.read(homeRepo);
    return products.getAllCategories(category);
  },
);
