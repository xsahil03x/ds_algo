import 'package:ds_algo/src/search/abstract_search_strategy.dart';

class LinearSearch<T extends Comparable<T>>
    implements AbstractSearchStrategy<T> {
  @override
  int perform(List<T> arr, T element) {
    for (var i = 0; i < arr.length - 1; i++) {
      if (arr[i] == element) return i;
    }
    return -1;
  }
}
