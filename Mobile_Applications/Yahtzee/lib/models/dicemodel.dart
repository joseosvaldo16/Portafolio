import 'package:flutter/foundation.dart';
import 'package:mp2/models/dice.dart';

// This class is a wrapper for the Dice class
// It extends ChangeNotifier so that it can notify listeners when the dice changes
class DiceModel extends ChangeNotifier {
  final dice = Dice(5, seed: 0);

  int rollCount = 0;

  void roll() {
    dice.roll();
    rollCount++;
    notifyListeners();
  }

  void toggleHold(int index) {
    dice.toggleHold(index);
    notifyListeners();
  }

  void clear() {
    dice.clear();
    rollCount = 0;
    notifyListeners();
  }

  void resetRollCount() {
    rollCount = 0;
    notifyListeners();
  }

  List<int> get values => dice.values;

  bool isHeld(int index) => dice.isHeld(index);
}
