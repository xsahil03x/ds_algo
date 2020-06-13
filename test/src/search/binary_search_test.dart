import 'package:ds_algo/src/ds_algo.dart';
import 'package:test/test.dart';

void main() {
  final binarySearch = BinarySearch<num>();
  final list = [8, 15, 25, 36, 45, 52, 69, 78, 85, 99];

  test('Should pass as the input element is available in the list', () {
    final expected = 5;
    final actual = binarySearch.perform(list, 52);
    expect(actual, expected);
  });

  test('Should fail as the input element is not available in the list', () {
    final expected = -1;
    final actual = binarySearch.perform(list, 33);
    expect(actual, expected);
  });
}
