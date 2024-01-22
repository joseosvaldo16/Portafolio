import 'package:flutter/cupertino.dart';
import 'package:mp2/views/diceview.dart';
import 'package:mp2/views/scoreview.dart';

class Yahtzee extends StatelessWidget {
  const Yahtzee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Yahtzee',
      // Use a ConstrainedBox to limit the size of the app
      home: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1280, maxHeight: 720),
          child: const Column(
            children: [
              // Use Expanded to size the widgets
              Expanded(flex: 2, child: DiceView()),
              Expanded(flex: 5, child: ScoreView()),
            ],
          )),
    );
  }
}
