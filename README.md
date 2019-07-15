# progress_dialog

A light weight package to show progress dialog. As it is a stateful widget, you can change the text shown on the dialog dynamically.

[Get the library](https://pub.dartlang.org/packages/progress_dialog) | [Example](https://pub.dartlang.org/packages/progress_dialog#-example-tab-)

## Supported Dart Versions
**Dart SDK version >= 2.1.0**

## Demo

<img src="https://raw.githubusercontent.com/fayaz07/progress_dialog/master/demo.gif" alt="Demo" />
<img src="https://raw.githubusercontent.com/fayaz07/progress_dialog/master/demo_1.gif" alt="Demo" />

## How to use

Add Package
```yaml
  progress_dialog: ^1.1.0+1
```


```dart
import 'package:progress_dialog/progress_dialog.dart';
```
Create an instance of ProgressDialog
```dart
ProgressDialog pr;
```

Initialise the pr object inside the **build()** method passing context to it

## For Normal Progress Dialog
<ol>
<li> Initialize the ProgressDialog object
  
```dart
pr = new ProgressDialog(context,ProgressDialogType.Normal);
```

</li>
  
<li>If need you can change the default message of progress dialog

```dart
pr.setMessage('Please wait...');
```

</li>

<li>Showing the progress dialog

```dart
pr.show();
```

</li>

<li>
Dynamically update the content shown out there

```dart
pr.update(message: "Few more seconds...");
```

</li>

<li>
Dismissing the progress dialog

```dart
pr.hide();
```

</li>  
</ol>

## For Download Progress Dialog
<ol> 
<li>  Initialize the ProgressDialog object

```dart
pr = new ProgressDialog(context,ProgressDialogType.Download);
```

</li>

<li>Showing the progress dialog

```dart
pr.show();
```

</li>

<li>If you have been using progress dialog of type Download, percentage should be a double

```dart
pr.update(progress: percentage,message: "Please wait...");
```

</li>


<li>Dismissing the progress dialog

```dart
pr.hide();
```

</li>
</ol>

### Check if progress dialog is showing

```dart
bool isProgressDialogShowing = pr.isShowing();
```

---
Loading indicator -> https://loading.io/
