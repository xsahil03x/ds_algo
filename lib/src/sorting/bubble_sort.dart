import 'package:ds_algo/src/sorting/abstract_sort_strategy.dart';

class BubbleSort<T extends Comparable<T>> implements AbstractSortStrategy<T> {
  @override
  List<T> perform(List<T> arr) {
    var list = List<T>.from(arr);
    var isSorted = false;
    var lastUnsortedIndex = list.length - 1;
    while (!isSorted) {
      isSorted = true;
      for (var i = 0; i < lastUnsortedIndex; i++) {
        if (list[i].compareTo(list[i + 1]) == 1) {
          swap(list, i, i + 1);
          isSorted = false;
        }
      }
      lastUnsortedIndex--;
    }
    return list;
  }

  void swap(List<T> list, int i, int j) {
    var temp = list[i];
    list[i] = list[j];
    list[j] = temp;
  }
}
