import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lon_stores/src/config/routes/app_router.gr.dart';
import 'package:lon_stores/src/config/theme/app_color.dart';
import 'package:lon_stores/src/features/home/presentation/widget/product_grid.dart';
import 'package:lon_stores/src/features/search/data/controller/search_provider.dart';
import 'package:lon_stores/src/features/search/data/notifier/search_state.dart';

@RoutePage()
class SearchPage extends StatefulHookConsumerWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';
  @override
  Widget build(BuildContext context) {
    final searchResult = ref.watch(searchProvider);
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchBar(),
              const SizedBox(height: 16),

              const SizedBox(height: 16),
              // Add your filtered content here based on the search text
              //  Text('Filtered Content: $_searchText'),
              if (_searchText.isNotEmpty)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Results for $_searchText",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${searchResult.products.length} founds",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              searchResult.status == SearchStatus.loading
                  ? const Center(child: CircularProgressIndicator())
                  : Expanded(
                      child: ProductGrid(products: searchResult.products),
                    )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: _searchController,
        onChanged: (value) {
          setState(() {
            _searchText = value;
          });
          final searchResult =
              ref.read(searchProvider.notifier).searchAndFilterProducts(
                    searchWord: _searchText,
                  );
        },
        autofocus: true,
        decoration: InputDecoration(
          hintText: 'Search...',
          prefixIcon: const Icon(Icons.search),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.filter_list,
              size: 30,
              color: AppColors.primaryColor,
            ),
            onPressed: () {
              context.pushRoute(FilterRoute(search: _searchText));
            },
          ),
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        ),
      ),
    );
  }
}
