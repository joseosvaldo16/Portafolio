import 'package:flutter/material.dart';
import 'package:mp2/models/dicemodel.dart';
import 'package:mp2/models/scorecard.dart';
import 'package:mp2/models/scorecardmodel.dart';
import 'package:provider/provider.dart';

class ScoreView extends StatefulWidget {
  const ScoreView({Key? key}) : super(key: key);

  @override
  State<ScoreView> createState() => _ScoreViewState();
}

class _ScoreViewState extends State<ScoreView> {
  @override
  Widget build(BuildContext context) {
    // Use Provider.of to access the DiceModel and ScoreCardModel
    final diceModel = Provider.of<DiceModel>(context);
    final scoreCardModel = Provider.of<ScoreCardModel>(context, listen: false);
    final scoretype = [
      ScoreCategory.threeOfAKind,
      ScoreCategory.fourOfAKind,
      ScoreCategory.fullHouse,
      ScoreCategory.smallStraight,
      ScoreCategory.largeStraight,
      ScoreCategory.yahtzee,
      ScoreCategory.chance,
    ];

    final scoretype2 = [
      ScoreCategory.ones,
      ScoreCategory.twos,
      ScoreCategory.threes,
      ScoreCategory.fours,
      ScoreCategory.fives,
      ScoreCategory.sixes,
    ];

    return Container(
      color: Colors.black,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    6,
                    (index) => Image.asset(
                      'assets/images/dice-six-faces-${index + 1}.png', // Adjusted index to start from 1
                      width: 50,
                      height: 50,
                    ),
                  ),
                ),
                Column(
                  children: List.generate(
                    6,
                    (index) => Container(
                      width: 50,
                      margin: const EdgeInsets.all(
                          4.0), // give some spacing between containers
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          try {
                            setState(() {
                              scoreCardModel.registerScore(
                                  scoretype2[index], diceModel.values);
                              diceModel.resetRollCount();
                              diceModel.clear();
                              if (scoreCardModel.completed) {
                                // Reset the game
                                scoreCardModel.clear();
                                diceModel
                                    .clear(); // Assuming you have a method to reset the dice game
                              }
                            });
                          } catch (e) {
                            print(
                                "Category already has a score. Ignoring tap.");
                          }
                        },
                        child: Center(
                          child: Text(scoreCardModel
                                      .scoreCard[scoretype2[index]] ==
                                  null
                              ? ' '
                              : '${scoreCardModel.scoreCard[scoretype2[index]]} '),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(width: 120),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('3x', style: TextStyle(color: Colors.white)),
                    SizedBox(height: 30),
                    Text('4x', style: TextStyle(color: Colors.white)),
                    SizedBox(height: 30),
                    Text('Full House', style: TextStyle(color: Colors.white)),
                    SizedBox(height: 30),
                    Text('Small Straight',
                        style: TextStyle(color: Colors.white)),
                    SizedBox(height: 30),
                    Text('Large Straight',
                        style: TextStyle(color: Colors.white)),
                    SizedBox(height: 30),
                    Text('Yahtzee', style: TextStyle(color: Colors.white)),
                    SizedBox(height: 30),
                    Text('Chance', style: TextStyle(color: Colors.white)),
                  ],
                ),
                Container(width: 30),
                Column(
                  children: List.generate(
                    7,
                    (index) => Container(
                      width: 50,
                      margin: const EdgeInsets.all(
                          4.0), // give some spacing between containers
                      padding: const EdgeInsets.all(
                          10.0), // Optional: to give some padding inside the container
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            scoreCardModel.registerScore(
                                scoretype[index], diceModel.values);
                            diceModel.resetRollCount();
                            diceModel.clear();
                            if (scoreCardModel.completed) {
                              // Reset the game
                              scoreCardModel.clear();
                            }
                          });
                        },
                        child: Center(
                          child: Text(scoreCardModel
                                      .scoreCard[scoretype[index]] ==
                                  null
                              ? ' '
                              : '${scoreCardModel.scoreCard[scoretype[index]]} '),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
