import 'dart:math';

import 'package:ds_algo/src/constants.dart';

import '../answer_approach.dart';

/// Question -:
// Given n non-negative integers representing an elevation map where the width
// of each bar is 1, compute how much water it is able to trap after raining.
// Input: arr[]   = [3, 0, 2, 0, 4]
// Output: 7
// Explanation:
// Structure is like below
//
//              | |
//  | |/////////| |
//  | |///| |///| |
//  | |///| |///| |
//   3  0  2  0  4
//
// We can trap "3 units" of water between 3 and 2,
// "1 unit" on top of bar 2 and "3 units" between 2
// and 4.

void main() {
  final elevationList = [0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1];
  final stopwatch = Stopwatch()..start();
  final totalTrappedWater = calculateTrappedRainwater(
    elevationList: elevationList,
    approach: Approach.BETTER,
  );
  stopwatch.stop();
  print('Total trapped water : $totalTrappedWater');
  print('Executed in ${stopwatch.elapsed}');
}

int calculateTrappedRainwater({
  List<int> elevationList,
  Approach approach,
}) {
  var total = 0;
  var length = elevationList.length;

  switch (approach) {

    /// Time Complexity -> O(n^2)
    /// Space Complexity -> O(1)
    case Approach.NAIVE:
      for (var i = 1; i < length - 1; i++) {
        var curr = elevationList[i];

        var left = curr;
        for (var j = 0; j < i; j++) {
          left = max(left, elevationList[j]);
        }

        var right = curr;
        for (var j = i + 1; j < length; j++) {
          right = max(right, elevationList[j]);
        }

        total += (min(left, right) - curr);
      }
      break;

    /// Time Complexity -> O(n)
    /// Space Complexity -> O(n)
    case Approach.BETTER:
      var prevMax = <int, int>{};
      var nextMax = <int, int>{};

      var max = INT_MIN;
      for (var i = 0; i < length; i++) {
        var curr = elevationList[i];
        if (curr > max) max = curr;
        nextMax[i] = max;
      }

      max = INT_MIN;
      for (var j = length - 1; j >= 0; j--) {
        var curr = elevationList[j];
        if (curr > max) max = curr;
        prevMax[j] = max;
      }

      for (var k = 0; k < length; k++) {
        total += min(nextMax[k], prevMax[k]) - elevationList[k];
      }
      break;

    /// Time Complexity -> O(n)
    /// Space Complexity -> O(1)
    case Approach.BEST:
      var left_max = 0;
      var right_max = 0;

      var lo = 0;
      var hi = length - 1;

      while (lo <= hi) {
        if (elevationList[lo] < elevationList[hi]) {
          if (elevationList[lo] > left_max) {
            left_max = elevationList[lo];
          } else {
            total += left_max - elevationList[lo];
          }
          lo++;
        } else {
          if (elevationList[hi] > right_max) {
            right_max = elevationList[hi];
          } else {
            total += right_max - elevationList[hi];
          }
          hi--;
        }
      }
      break;
  }

  return total;
}
