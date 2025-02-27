import 'package:flutter/material.dart';
import 'lion_input.dart';

class LionForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final List<LionInput> fields;
  final VoidCallback onSubmit;

  const LionForm(
      {super.key,
      required this.formKey,
      required this.fields,
      required this.onSubmit});

  @override
  // ignore: library_private_types_in_public_api
  _LionFormState createState() => _LionFormState();
}

class _LionFormState extends State<LionForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          ...widget.fields,
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              if (widget.formKey.currentState!.validate()) {
                widget.onSubmit();
              }
            },
            child: Text("Submit"),
          ),
        ],
      ),
    );
  }
}
