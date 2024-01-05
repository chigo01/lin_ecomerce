// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:collection/collection.dart';
import 'package:lon_stores/src/DTO/product_model.dart';

enum SearchStatus {
  initial,
  loading,
  error,
  authorized,
}

class SearchState {
  final SearchStatus status;
  final List<Product> products;

  SearchState(this.status, this.products);

  SearchState copyWith({
    SearchStatus? status,
    List<Product>? products,
  }) {
    return SearchState(
      status ?? this.status,
      products ?? this.products,
    );
  }

  @override
  bool operator ==(covariant SearchState other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.status == status && listEquals(other.products, products);
  }

  @override
  int get hashCode => status.hashCode ^ products.hashCode;
}
