// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:clean_tdd_bloc/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:clean_tdd_bloc/main.dart';

void main() {
  init();
  testWidgets('Find OK', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      Clean(),
      Duration(seconds: 3),
    );

    final titleFinder = find.text("OK");
    // Verify that our counter starts at 0.
    await tester.pump();
    expect(titleFinder, findsOneWidget);
    /* expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));


    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);*/
  });
}
