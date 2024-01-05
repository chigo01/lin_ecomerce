import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lon_stores/src/features/search/data/notifier/search_notifier.dart';
import 'package:lon_stores/src/features/search/data/notifier/search_state.dart';

final searchProvider = NotifierProvider<SearchAndFilterNotifier, SearchState>(
    () => SearchAndFilterNotifier());
