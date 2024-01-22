import 'package:flutter/material.dart';
import 'package:mp2/models/dicemodel.dart';
import 'package:mp2/models/scorecardmodel.dart';
import 'package:provider/provider.dart';
import 'views/yahtzee.dart';

void main() {
  runApp(
    //the MultiProvider widget allows us to use multiple providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DiceModel()),
        ChangeNotifierProvider(create: (context) => ScoreCardModel()),
      ],
      child: const MaterialApp(
        color: Colors.black,
        title: 'Yahtzee',
        home: Scaffold(
          body: Yahtzee(),
        ),
      ),
    ),
  );
}
