// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:mp5/Views/app.dart';
import 'package:mp5/models/favoritecitiesmodel.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Weather app test', (WidgetTester tester) async {
    // Mock your FavoriteCitiesModel or use a Provider to supply it
    final favoriteCitiesModel = FavoriteCitiesModel();

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      ChangeNotifierProvider<FavoriteCitiesModel>(
        create: (context) => favoriteCitiesModel,
        child: const MyWeatherApp(),
      ),
    );
  });
}

class HomePage {}
