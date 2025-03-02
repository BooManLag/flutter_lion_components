// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_lion_components/components/lion_dialog.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('LionDialog displays correct title and content', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (BuildContext context) {
            return Scaffold(
              body: Center(
                child: ElevatedButton(
                  onPressed: () {
                    LionDialog.show(
                      context,
                      title: 'Test Title',
                      content: 'Test Content',
                    );
                  },
                  child: Text('Show Dialog'),
                ),
              ),
            );
          },
        ),
      ),
    );

    // Tap the button to show the dialog
    await tester.tap(find.text('Show Dialog'));
    await tester.pumpAndSettle(); // Wait for the dialog to appear

    // Verify the dialog's title and content are displayed
    expect(find.text('Test Title'), findsOneWidget);
    expect(find.text('Test Content'), findsOneWidget);
  });
}
