import 'package:ds_algo/src/sorting/abstract_sort_strategy.dart';

class InsertionSort<T extends Comparable<T>>
    implements AbstractSortStrategy<T> {
  @override
  List<T> perform(List<T> arr) {
    var list = List<T>.from(arr);
    for (var i = 1; i < list.length; i++) {
      var temp = list[i];
      var j = i - 1;
      while (j >= 0 && temp.compareTo(list[j]) == -1) {
        list[j + 1] = list[j];
        j--;
      }
      list[j + 1] = temp;
    }
    return list;
  }
}
