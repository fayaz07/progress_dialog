# progress_dialog

A light weight package to show progress dialog. As it is a stateful widget, you can change the text shown on the dialog dynamically.

[Get the library](https://pub.dartlang.org/packages/progress_dialog) | [Example](https://pub.dartlang.org/packages/progress_dialog#-example-tab-)

## Supported Dart Versions
**Dart SDK version >= 2.1.0**

## Demo
| Normal        | Download      |
| ------------- |:-------------:|
|<img src="https://raw.githubusercontent.com/fayaz07/progress_dialog/master/stateful_1.gif" width="50%" height="50%" alt="ProgressDialog Demo" />       | <img src="https://raw.githubusercontent.com/fayaz07/progress_dialog/master/stateful_2.gif" width="50%" height="40%" alt="ProgressDialog Demo" /> |


## How to use

Add Package
```yaml
  progress_dialog: ^1.0.5
```

Import the package

```dart
import 'package:progress_dialog/progress_dialog.dart';
```
Create an instance of ProgressDialog
```dart
ProgressDialog pr;
```

Initialise the pr object inside the **build()** method passing context to it

> For Normal Progress Dialog
```dart
pr = new ProgressDialog(context,ProgressDialogType.Normal);
```

> For Download Progress Dialog
```dart
pr = new ProgressDialog(context,ProgressDialogType.Download);
```

If need you can change the default message of progress dialog
```dart
pr.setMessage('Please wait...');
```

Showing the progress dialog
```dart
pr.show();
```

Dynamically update the content shown out there
```dart
pr.update(message: "Few more seconds...");
```

If you have been using progress dialog of type **Download**, percentage should be a *double*
```dart
pr.update(progress: percentage,message: "Please wait...");
```

Dismissing the progress dialog
```dart
pr.hide();
```

Check if progress dialog is showing
```dart
bool isProgressDialogShowing = pr.isShowing();
```

