import 'package:flutter/foundation.dart';
import 'scorecard.dart';

// This class is a wrapper for the ScoreCard class
// It extends ChangeNotifier so that it can notify listeners when the scoreCard changes
class ScoreCardModel extends ChangeNotifier {
  final ScoreCard _scoreCard = ScoreCard();

  // Getter for the scoreCard
  ScoreCard get scoreCard => _scoreCard;

  bool get completed => _scoreCard.completed;

  int get total => _scoreCard.total;

  // Register score and notify listeners
  void registerScore(ScoreCategory category, List<int> dice) {
    _scoreCard.registerScore(category, dice);

    notifyListeners();
  }

  // Clear the scoreCard and notify listeners
  void clear() {
    _scoreCard.clear();
    notifyListeners();
  }
}
