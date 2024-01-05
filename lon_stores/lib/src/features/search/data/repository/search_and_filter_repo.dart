import 'package:lon_stores/src/DTO/product_model.dart';
import 'package:lon_stores/src/core/utils/services/api_methods.dart';

class SearchRepo {
  final List<Product> _products;

  SearchRepo(List<Product> products) : _products = products;

  List<Product> updateFilteredProducts({
    bool? hasFiltered,
    String? category,
    String? sortBy,
    double minPrice = 100,
    double maxPrice = 10000,
    required String searchTerm,
  }) {
    List<Product> filteredProducts = [];
    if (searchTerm.isEmpty) {
      filteredProducts = List.from(_products);
    } else {
      if (!hasFiltered!) {
        filteredProducts = _products
            .where(
              (product) => (product.title.toLowerCase().contains(searchTerm) ||
                  product.category.toLowerCase().contains(searchTerm)),
            )
            .toList();
      } else {
        filteredProducts = _products
            .where(
              (product) => (product.title.toLowerCase().contains(searchTerm) ||
                  product.category.toLowerCase().contains(searchTerm) &&
                      product.category.toLowerCase().contains(category ?? '') &&
                      product.price >= minPrice &&
                      product.price <= maxPrice),
            )
            .toList()
          ..sort(
            (a, b) {
              if (sortBy == "Ratings") {
                return a.rating.rate.compareTo(b.rating.rate);
              } else {
                return a.rating.rate.compareTo(b.rating.rate);
              }
            },
          );
      }
    }
    return filteredProducts;
  }
}

Future<List<Product>> getAllProducts() async {
  final HttpUtils http = HttpUtils();
  const String url = "/";
  final products = await http.get(url) as List;
  return products.map((e) => Product.fromJson(e)).toList();
}
