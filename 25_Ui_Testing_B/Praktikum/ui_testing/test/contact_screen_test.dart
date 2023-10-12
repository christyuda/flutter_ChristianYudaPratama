import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_testing/main.dart';

void main() {
  testWidgets('UI Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the app's title is displayed.
    expect(find.text('Contact List'), findsOneWidget);

    // Enter text into the Name and Phone text fields and tap the Add Contact button.
    await tester.enterText(find.bySemanticsLabel('Name'), 'John Doe');
    await tester.enterText(find.bySemanticsLabel('Phone'), '1234567890');
    await tester.tap(find.text('Add Contact'));
    await tester.pump();

    // Verify that the contact is added to the list.
    expect(find.text('John Doe'), findsOneWidget);
    expect(find.text('1234567890'), findsOneWidget);

    // Tap the Edit button for the added contact.
    await tester.tap(find.byIcon(Icons.edit));
    await tester.pump();

    // Verify that the Edit Contact form is displayed.
    expect(find.text('Save Contact'), findsOneWidget);

    // Enter updated text and tap the Save Contact button.
    await tester.enterText(find.bySemanticsLabel('Name'), 'Jane Doe');
    await tester.enterText(find.bySemanticsLabel('Phone'), '9876543210');
    await tester.tap(find.text('Save Contact'));
    await tester.pump();

    // Verify that the contact is updated.
    expect(find.text('Jane Doe'), findsOneWidget);
    expect(find.text('9876543210'), findsOneWidget);

    // Tap the Delete button for the added contact.
    await tester.tap(find.byIcon(Icons.delete));
    await tester.pump();

    // Verify that the contact is deleted.
    expect(find.text('John Doe'), findsNothing);
    expect(find.text('1234567890'), findsNothing);
  });
}
