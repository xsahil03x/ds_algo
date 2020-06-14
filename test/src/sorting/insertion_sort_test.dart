import 'package:ds_algo/src/ds_algo.dart';
import 'package:test/test.dart';

void main() {
  final list = [12, 54, 13, 48, 61, 548, 660, 486, 155, 693];
  final insertionSort = InsertionSort<num>();

  test('Should pass as expected list is similar to sorted list', () {
    final expected = [12, 13, 48, 54, 61, 155, 486, 548, 660, 693];
    final actual = insertionSort.perform(list);
    expect(actual, expected);
  });
}
