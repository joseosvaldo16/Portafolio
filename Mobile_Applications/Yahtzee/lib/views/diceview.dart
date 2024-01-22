import 'package:flutter/material.dart';
import 'package:mp2/models/dicemodel.dart';
import 'package:mp2/models/scorecardmodel.dart';
import 'package:provider/provider.dart';

class DiceView extends StatefulWidget {
  const DiceView({Key? key}) : super(key: key);

  @override
  State<DiceView> createState() => _DiceViewState();
}

class _DiceViewState extends State<DiceView> {
  @override
  Widget build(BuildContext context) {
    // Use Provider.of to access the DiceModel and ScoreCardModel
    final diceModel = Provider.of<DiceModel>(context);
    final scoreCardModel = Provider.of<ScoreCardModel>(context, listen: false);

    return MaterialApp(
      title: 'DiceView',
      home: Scaffold(
        backgroundColor:
            Colors.black, // Add this line to set the background color
        appBar: AppBar(
          title: const Text('Yahtzee',
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // Use List.generate to create a list of widgets
                children: List.generate(
                  diceModel.values.length,
                  // Use an index to access the values in the list
                  (index) => GestureDetector(
                    // Wrap the image in a GestureDetector
                    onTap: () {
                      //Change the state of the dice when tapped
                      setState(() {
                        diceModel.toggleHold(index);
                      });
                    },
                    // Use a Container to add a border around the image
                    child: Container(
                      decoration: BoxDecoration(
                        border: diceModel.isHeld(index)
                            ? Border.all(color: Colors.red, width: 2)
                            : null,
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        // Use the value of the dice using the index to select the image
                        'assets/images/dice-six-faces-${diceModel.values[index]}.png',
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ),
                ),
              ),
              // Add some spacing between the dice and the buttons
              Column(
                children: [
                  // Use a Row to display the buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Roll Dice button
                      ElevatedButton(
                        // Disable the button after three rolls
                        onPressed: diceModel.rollCount < 3
                            ? () {
                                // setState rebuilds the dice image widgets
                                setState(() {
                                  //
                                  diceModel.roll();
                                });
                              }
                            : null,
                        child: Text(
                            'Roll Dice ${diceModel.rollCount.toString()}',
                            style: const TextStyle(color: Colors.blue)),
                      ),
                      //Reset Dice button
                      ElevatedButton(
                          child: const Text('Reset Game'),
                          onPressed: () {
                            setState(() {
                              diceModel.clear();
                              scoreCardModel.clear();
                            });
                          }),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.all(8.0)),
                  Text(
                    // display the score or an empty string
                    'Total Score: ${scoreCardModel.scoreCard.total.toString()}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
