import 'package:lon_stores/src/DTO/product_model.dart';
import 'package:lon_stores/src/core/utils/services/api_methods.dart';

class ProductDetailRepository {
  final HttpUtils http = HttpUtils();

  Future<Product> getProduct(int productId) async {
    final String url = "/$productId";
    final products = await http.get(url);
    return Product.fromJson(products);
  }
}
