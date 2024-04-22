## Query

How to use ContextExtension in main file?

## Result

To use the `ContextExtension` in your main Flutter application, you first need to define it in a Dart file, and then you can use it across your application for streamlined navigation and context manipulation. Here's a step-by-step guide on how to do this:

### Step 1: Define the Context Extension
Create a Dart file for your extension. You might call this file `context_extensions.dart`. Here's how you define the extension based on the previous example:

```dart
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

extension ContextExtension on BuildContext {
  void goBack() {
    AutoRouter.of(this).pop();
  }

  void goToHome() {
    AutoRouter.of(this).replaceAll([const HomeRoute()]);
  }
}
```

This extension adds methods to `BuildContext` that allow you to easily handle common navigation actions.

### Step 2: Import the Extension
In any Dart file where you want to use these extended methods, you need to import your `context_extensions.dart`. For example, if you want to use it in your main app file:

**main.dart**
```dart
import 'package:flutter/material.dart';
import 'your_directory_path/context_extensions.dart'; // Update the path according to your project structure

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
```

### Step 3: Use the Extension
Now you can use the methods defined in your extension directly on any `BuildContext` object within your Flutter widgets. For example:

```dart
import 'package:flutter/material.dart';
import 'context_extensions.dart'; // Make sure this import is at the top

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                context.goBack(); // Using the extension method
              },
              child: Text("Go Back"),
            ),
            ElevatedButton(
              onPressed: () {
                context.goToHome(); // Using the extension method
              },
              child: Text("Go to Home"),
            ),
          ],
        ),
      ),
    );
  }
}
```

### Step 4: Handle Potential Issues
Make sure that your navigation context is correctly handled. Using such extensions can lead to errors if the context isn't attached to a `Navigator`. Ensure that your context calls are made in a place where a `Navigator` is available in the widget tree.

By following these steps, you can effectively use the `ContextExtension` throughout your application, making your navigation code cleaner and more maintainable.
