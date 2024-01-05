import 'package:lon_stores/src/DTO/product_model.dart';

abstract class HomeRepo {
  Future<List<Product>> getCategoryWithLimit(String category);
  Future<List<Product>> getAllCategories(String category);
}
