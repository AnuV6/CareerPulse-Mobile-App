// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:career_pulse/main.dart';

void main() {
  testWidgets('Find initial screen text', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(const MainApp());

    // Depending on your app's initial screen, you may need to update these finds.
    // For example, if the splash screen has text 'Loading', test it like this:
    expect(find.text('Loading'), findsOneWidget);

    // If your app transitions after a delay, use pumpAndSettle:
    await tester.pumpAndSettle(); // Waits for animations to complete.

    // Now, check the presence of further expected widgets
    // (adjust based on the structure of your app's initial screen).
  });
}
