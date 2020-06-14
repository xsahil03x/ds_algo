import 'package:ds_algo/src/sorting/abstract_sort_strategy.dart';

class SelectionSort<T extends Comparable<T>>
    implements AbstractSortStrategy<T> {
  @override
  List<T> perform(List<T> arr) {
    var list = List<T>.from(arr);
    for (var i = 0; i < list.length - 1; i++) {
      var minIndex = i;
      for (var j = i + 1; j < list.length; j++) {
        if (list[j].compareTo(list[minIndex]) == -1) {
          minIndex = j;
        }
      }
      if (minIndex != i) swap(list, i, minIndex);
    }
    return list;
  }

  void swap(List<T> list, int i, int j) {
    var temp = list[i];
    list[i] = list[j];
    list[j] = temp;
  }
}
