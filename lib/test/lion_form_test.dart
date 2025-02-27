import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_lion_components/components/lion_form.dart';
import 'package:flutter_lion_components/components/lion_input.dart';

void main() {
  testWidgets('LionForm validates inputs before submission', (WidgetTester tester) async {
    final formKey = GlobalKey<FormState>();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LionForm(
            formKey: formKey,
            fields: [
              LionInput(
                label: 'Name',
                value: '',
                onChanged: (val) {},
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required';
                  }
                  return null;
                },
              ),
            ],
            onSubmit: () {},
          ),
        ),
      ),
    );


    expect(formKey.currentState, isNotNull);

    formKey.currentState?.validate();
    await tester.pump();

    expect(formKey.currentState?.validate(), isFalse);
  });
}
