import 'package:lon_stores/src/DTO/product_model.dart';
import 'package:lon_stores/src/core/utils/services/api_methods.dart';
import 'package:lon_stores/src/features/home/data/repository/home_repo.dart';

class HomeRepository implements HomeRepo {
  final HttpUtils http = HttpUtils();
  @override
  Future<List<Product>> getAllCategories(String category) async {
    final String url = "/category/$category";
    final products = await http.get(url) as List;
    return products.map((e) => Product.fromJson(e)).toList();
  }

  @override
  Future<List<Product>> getCategoryWithLimit(String category) async {
    final String url = "/category/$category?limit=4";
    final products = await http.get(url) as List;
    return products.map((e) => Product.fromJson(e)).toList();
  }
}
