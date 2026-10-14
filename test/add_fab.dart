import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jfkgdkhkfd/widgets/add_fab.dart';

void main() {
  testWidgets('Add FAB renders and triggers onPressed when tap', (
    WidgetTester tester,
  ) async {
    bool wasPressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          floatingActionButton: AddFAB(
            onPressed: () {
              wasPressed = true;
            },
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(find.byType(AddFAB));
    await tester.pump();
    expect(wasPressed, isTrue);
  });
}
