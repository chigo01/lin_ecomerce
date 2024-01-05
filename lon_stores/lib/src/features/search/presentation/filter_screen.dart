import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lon_stores/src/config/theme/app_color.dart';
import 'package:lon_stores/src/core/utils/const/product_categories.dart';
import 'package:lon_stores/src/features/search/data/controller/search_provider.dart';

@RoutePage()
class FilterPage extends StatefulHookConsumerWidget {
  const FilterPage({super.key, required this.search});
  final String search;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => FilterPageState();
}

class FilterPageState extends ConsumerState<FilterPage> {
  String _selectedCategory = 'electronics';
  String _selectedSortBy = 'Ratings';
  RangeValues _priceRange = const RangeValues(100, 10000);

  // List<String> categories = ['All', 'Electronics', 'Clothing', 'Books', 'Home'];

  List<String> sortOptions = ['Ratings', 'Price High'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Filter'),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: _buildApplyButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildCategoryDropdown(),
            const SizedBox(height: 16),
            _buildSortByDropdown(),
            const SizedBox(height: 16),
            _buildPriceRangeSlider(),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Category',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButton<String>(
            value: _selectedCategory,
            onChanged: (newValue) {
              setState(() {
                _selectedCategory = newValue!;
              });
            },
            items: categories.map((category) {
              return DropdownMenuItem<String>(
                value: category.category,
                child: Text(category.categories.name),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildSortByDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sort By',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButton<String>(
            value: _selectedSortBy,
            onChanged: (newValue) {
              setState(() {
                _selectedSortBy = newValue!;
              });
            },
            items: sortOptions.map((sortOption) {
              return DropdownMenuItem<String>(
                value: sortOption,
                child: Text(sortOption),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildPriceRangeSlider() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Price Range',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
        ),
        const SizedBox(height: 8),
        RangeSlider(
          values: _priceRange,
          min: 100,
          max: 10000,
          divisions: 100,
          onChanged: (values) {
            setState(() {
              _priceRange = values;
            });
          },
          labels: RangeLabels(
            '\$${_priceRange.start.toStringAsFixed(2)}',
            '\$${_priceRange.end.toStringAsFixed(2)}',
          ),
        ),
      ],
    );
  }

  Widget _buildApplyButton() {
    return ElevatedButton(
      onPressed: () {
        ref.read(searchProvider.notifier).searchAndFilterProducts(
              searchWord: widget.search,
              hasFiltered: true,
              minPrice: _priceRange.start.toDouble(),
              maxPrice: _priceRange.end.toDouble(),
              category: _selectedCategory,
              sortBy: _selectedSortBy,
            );
        Navigator.pop(context);
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Text(
          'Apply Filters',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
