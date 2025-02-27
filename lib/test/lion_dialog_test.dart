import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_lion_components/components/lion_dialog.dart';

void main() {
  testWidgets('LionDialog displays correct title and content',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
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

    await tester.tap(find.text('Show Dialog'));
    await tester.pump();

    expect(find.text('Test Title'), findsOneWidget);
    expect(find.text('Test Content'), findsOneWidget);
  });
}
