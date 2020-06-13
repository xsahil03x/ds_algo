import 'abstract_search_strategy.dart';

class BinarySearch<T extends Comparable<T>>
    implements AbstractSearchStrategy<T> {
  @override
  int perform(List<T> arr, T element) {
    var start = 0;
    var end = arr.length - 1;
    while (start <= end) {
      final mid = (start + end) ~/ 2;
      if (element.compareTo(arr[mid]) == 0) return mid;
      if (element.compareTo(arr[mid]) == -1) {
        end = mid - 1;
      } else if (element.compareTo(arr[mid]) == 1) {
        start = mid + 1;
      }
    }
    return -1;
  }
}
