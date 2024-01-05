enum Categories {
  electronics,
  jewelry,
  men,
  women,
}

final class ProductCat {
  final String category;
  final Categories categories;
  ProductCat({
    required this.category,
    required this.categories,
  });
}
