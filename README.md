# progress_dialog

A light weight package to show progress dialog. As it is a stateful widget, you can change the text shown on the dialog dynamically.

[Get the library](https://pub.dartlang.org/packages/progress_dialog) | [Example](https://pub.dartlang.org/packages/progress_dialog#-example-tab-)

## Supported Dart Versions
**Dart SDK version >= 2.1.0**

## Demo

<img src="https://raw.githubusercontent.com/fayaz07/progress_dialog/master/demo.gif" alt="Demo"/> <img src="https://raw.githubusercontent.com/fayaz07/progress_dialog/master/demo_1.gif" alt="Demo" />

## How to use

Add the Package
```yaml
  progress_dialog: ^1.2.0
```


```dart
import 'package:progress_dialog/progress_dialog.dart';
```
Create an instance of ProgressDialog
```dart
ProgressDialog pr;
```

Initialise the *pr* object inside the **build()** method passing context to it

## For Normal Progress Dialog
<ol>
<li> Initialize the ProgressDialog object
  
```dart
    pr = new ProgressDialog(context);
```
</li>


<li> By default it is a normal dialog to show some message, if you would like to use it to show percentage of progress done, specify the optional *type* parameter (Optional)
  
```dart
    pr = new ProgressDialog(context,type: ProgressDialogType.Normal);
```
</li>

  
<li>Style the progress dialog (Optional)

```dart
    pr.style(
      message: 'Downloading file...',
      borderRadius: 10.0,
      backgroundColor: Colors.white,
      progressWidget: CircularProgressIndicator(),
      elevation: 10.0,
      insetAnimCurve: Curves.easeInOut,
      progress: 0.0,
      maxProgress: 100.0,
      progressTextStyle: TextStyle(
          color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
      messageTextStyle: TextStyle(
          color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600),
    );
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
    pr.update(
      progress: 50.0,
      message: "Please wait...",
      progressWidget: Container(
          padding: EdgeInsets.all(8.0), child: CircularProgressIndicator()),
      maxProgress: 100.0,
      progressTextStyle: TextStyle(
          color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
      messageTextStyle: TextStyle(
          color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600),
    );
```

</li>

<li>
Dismissing the progress dialog

```dart
    pr.hide();
```

</li>  
</ol>


### Check if progress dialog is showing

```dart
bool isProgressDialogShowing = pr.isShowing();
print(isProgressDialogShowing);
```

### Want to contribute? 
Pull requests are always welcome!

#### How to contribute?

* Fork the repository
* Clone it to your local machine
* Open the project in your favourite editor
* Open cmd/terminal and run **flutter clean** and then **flutter packages get**
* Make the changes
* Create a *pull request*

---
Loading indicator -> https://loading.io/
