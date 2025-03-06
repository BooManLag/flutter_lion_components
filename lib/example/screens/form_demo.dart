import 'package:flutter/material.dart';
import 'package:flutter_lion_components/components/lion_input.dart';
import 'package:flutter_lion_components/components/lion_form.dart';
import 'package:flutter_lion_components/components/lion_dialog.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _name = '';

  void _showDialog() {
    LionDialog.show(
      context,
      title: "Hello!",
      content: "Welcome to Flutter Lion Components",
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _showDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form Screen")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            LionForm(
              formKey: _formKey,
              fields: [
                LionInput(
                  label: "Your Name",
                  value: _name,
                  onChanged: (val) => setState(() => _name = val),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your name";
                    }
                    return null;
                  },
                ),
              ],
              onSubmit: _submitForm,
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}