import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lon_stores/src/DTO/product_model.dart';
import 'package:lon_stores/src/features/product/data/repository/product_repo.dart';

final homeRepo = Provider((ref) => ProductDetailRepository());
final getProduct = FutureProvider.autoDispose.family<Product, int>(
  (ref, id) async {
    final products = ref.read(homeRepo);
    return products.getProduct(id);
  },
);
