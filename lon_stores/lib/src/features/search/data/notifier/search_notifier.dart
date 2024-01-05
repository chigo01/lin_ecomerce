import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lon_stores/src/DTO/product_model.dart';
import 'package:lon_stores/src/features/search/data/notifier/search_state.dart';
import 'package:lon_stores/src/features/search/data/repository/search_and_filter_repo.dart';

class SearchAndFilterNotifier extends Notifier<SearchState> {
  @override
  build() {
    return SearchState(
      SearchStatus.initial,
      [],
    );
  }

  Future<void> searchAndFilterProducts({
    required String searchWord,
    String? category,
    double minPrice = 100,
    double maxPrice = 10000,
    String? sortBy,
    bool hasFiltered = false,
  }) async {
    try {
      state = state.copyWith(
        status: SearchStatus.loading,
      );
      final products = await getAllProducts();
      SearchRepo productManager = SearchRepo(products);

      List<Product> result = productManager.updateFilteredProducts(
        searchTerm: searchWord,
        maxPrice: maxPrice,
        minPrice: minPrice,
        sortBy: sortBy,
        hasFiltered: hasFiltered,
        category: category,
      );
      state = state.copyWith(
        status: SearchStatus.authorized,
        products: result,
      );
    } catch (e) {
      print(e);
    }
  }
}
