import 'package:flutter/material.dart';
import 'package:flutter_lion_components/components/lion_input.dart';
import 'package:flutter_lion_components/components/lion_dialog.dart';
import 'package:flutter_lion_components/components/lion_form.dart';
import 'package:flutter_lion_components/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Lion Components Demo',
      theme: AppTheme .themeData,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      appBar: AppBar(title: Text("Flutter Lion Components")),
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