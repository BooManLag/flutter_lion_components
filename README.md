# Flutter Lion Components 🦁

A Flutter UI component library inspired by [Lion Web Components](https://lion-web-components.netlify.app/). Designed to provide high-quality, accessible, and customizable form elements for Flutter applications.

## ✨ Features
- **Lion-Inspired UI** – Matches the styling and behavior of Lion Web Components.
- **Themed & Customizable** – Supports light/dark modes, custom colors, and typography.
- **Form Validation** – Built-in validation logic inspired by Lion’s validation system.
- **Accessible** – Follows Flutter’s Material accessibility best practices.

## 🚀 Installation
Add the package to your `pubspec.yaml`:
```yaml
dependencies:
  flutter_lion_components:
    git:
      url: https://github.com/BooManLag/flutter_lion_components.git
```
Then, run:
```sh
flutter pub get
```

## 🛠️ Usage
### Lion Input
```dart
LionInput(
  label: "Your Name",
  value: "",
  onChanged: (val) => print("User typed: \$val"),
  validator: (value) {
    if (value == null || value.isEmpty) return "This field is required";
    return null;
  },
)
```

### Lion Button
```dart
LionButton(
  label: "Submit",
  onPressed: () {
    print("Button Clicked!");
  },
)
```

### Lion Form
```dart
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
LionForm(
  formKey: _formKey,
  fields: [
    LionInput(
      label: "Email",
      value: "",
      onChanged: (val) => print(val),
    ),
  ],
  onSubmit: () {
    if (_formKey.currentState!.validate()) {
      print("Form submitted!");
    }
  },
)
```

### Lion Dialog
```dart
LionDialog.show(
  context,
  title: "Hello!",
  content: "Welcome to Flutter Lion Components",
);
```

## 🎨 Theming
Lion components follow a **themed approach**. You can apply light/dark mode:
```dart
MaterialApp(
  theme: LionTheme.lightTheme,
  darkTheme: LionTheme.darkTheme,
  home: HomePage(),
);
```

## 🧪 Running Tests
To validate the components:
```sh
flutter test
```

## 📜 License
MIT License