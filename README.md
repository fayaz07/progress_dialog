# progress_dialog

A light weight package to show progress dialog. As it is a stateful widget, you can change the text shown on the dialog dynamically.

[![](https://img.shields.io/badge/dontate-Buy%20Me%20a%20Coffee-blueviolet)](https://www.buymeacoffee.com/fayaz) &nbsp; 
[![LinkedIn](https://img.shields.io/badge/LinkedIn-in-0e76a8)](https://www.linkedin.com/in/fayaz07) &nbsp; [![Follow](https://img.shields.io/github/followers/fayaz07?style=social)](https://github.com/fayaz07) &nbsp; [![Fork](https://img.shields.io/github/forks/fayaz07/progress_dialog?style=social)](https://github.com/fayaz07/progress_dialog/fork) &nbsp; [![Star](https://img.shields.io/github/stars/fayaz07/progress_dialog?style=social)](https://github.com/fayaz07/progress_dialog/star) &nbsp; [![Watches](https://img.shields.io/github/watchers/fayaz07/progress_dialog?style=social)](https://github.com/fayaz07/progress_dialog/) 

[![Get the library](https://img.shields.io/badge/Get%20library-pub-blue)](https://pub.dev/packages/progress_dialog) &nbsp; [![Example](https://img.shields.io/badge/Example-Ex-success)](https://pub.dev/packages/progress_dialog#-example-tab-)



## Supported Dart Versions
**Dart SDK version >= 2.1.0**


## Demo

<img src="https://raw.githubusercontent.com/fayaz07/progress_dialog/master/progress_dialog_1.png" height="35%" width="35%"  alt="Normal dialog Demo"/> <img src="https://raw.githubusercontent.com/fayaz07/progress_dialog/master/progress_dialog_2.png"   height="35%" width="35%" alt="Download dialog Demo" />


## Installation
[![Pub](https://img.shields.io/badge/pub-1.2.0-blue)](https://pub.dev/packages/progress_dialog)

Add the Package
```yaml
dependencies:
  progress_dialog: ^1.2.2
```

## How to use



Import the package in your dart file

```dart
import 'package:progress_dialog/progress_dialog.dart';
```
Create an instance of ProgressDialog
```dart
ProgressDialog pr;
```

Initialise the **pr** object inside the **build()** method passing context to it

<ol>
<li> Initialize the ProgressDialog object <br>  

```dart
pr = new ProgressDialog(context);
```
</li>


<li> By default it is a normal dialog to show some message, if you would like to use it to show percentage of progress done, specify the optional <b>type</b> parameter and specify if you want your dialog to dismiss when back button is pressed <b>isDismissible</b> parameter (Optional) <br/>

```dart
//For normal dialog
pr = ProgressDialog(context,type: ProgressDialogType.Normal, isDismissible: true/false, showLogs: true/false);
    
//For showing progress percentage
pr =  ProgressDialog(context,type: ProgressDialogType.Download, isDismissible: true/false, showLogs: true/false);
```
</li>
> Note: Please initialize the ```ProgressDialog```, where you have availability of the context
  
<li>Style the progress dialog (Optional)<br/>

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
     color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600)
  );
```
```note
Note: You don't need to use all parameters, all of them are optional
```

</li>

<li>Showing the progress dialog<br>
  
```dart
await pr.show();
```
</li>

<li>
Dynamically update the content shown out there <br/>
  
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
```note
Note: You don't need to use all parameters, all of them are optional
```
</li>


<li>
Dismissing the progress dialog<br/>
  
```dart
pr.hide().then((isHidden) {
  print(isHidden);
});

// or
await pr.hide();
```

</li>

</ol>

> Navigating to next screens must be done after the completion of Future - hide(). [See here for example](https://gist.github.com/fayaz07/52dfe04d9f8594501465f169aa6ef6b6)

### Check if progress dialog is showing

```dart
bool isProgressDialogShowing = pr.isShowing();
print(isProgressDialogShowing);
```

### Use custom body
```dart
    pr = ProgressDialog(
      context,
      type: ProgressDialogType.Normal,
      isDismissible: true,
      /// your body here
      customBody: LinearProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
        backgroundColor: Colors.white,
      ),
    );
```


---


## Demo

<img src="https://raw.githubusercontent.com/fayaz07/progress_dialog/master/pd_demo_nd.gif" alt="Normal dialog Demo"/> <img src="https://raw.githubusercontent.com/fayaz07/progress_dialog/master/pd_demo_dd.gif" alt="Download dialog Demo" />


### Default configuration/styles

If you don't like to configure/style the dialog and continue with the default style, it's okay but just have a look at our default configuration.

| Attribute           | Value   |
| -------------       | :-----:|
| Dismissible         |    true |
| ProgressDialogType  |    ProgressDialogType.Normal |
| BackgroundColor     | Colors.white |
| BorderRadius        |   RoundedRectangularBorder(radius: 8.0) |
| AnimationCurve      |    Curves.easeInOut |
| Elevation           |    8.0 |
| ProgressWidget      |    Double_rings_loding_indicator |
| MessageTextStyle    |    color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600 |
| ProgressTextStyle   |    color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400 |
| showLogs            |    false |

#### Well let's discuss limits for configuring it

| Attribute           | Can be updated during instantiating   | Can be updated during styling   |Can be updated during dialog is shown |
| -------------       | :-------------------------------:     |:------------------------------: |:-------------------------------:     |
| Dismissible         | Yes                                   |No                               |No                                    |
| ProgressDialogType  | Yes                                   |No                               |No                                    |
| BackgroundColor     | No                                    |Yes                              |No                                    |
| BorderRadius        | No                                    |Yes                              |No                                    |
| AnimationCurve      | No                                    |Yes                              |No                                    |
| Elevation           | No                                    |Yes                              |No                                    |
| ProgressWidget      | No                                    |Yes                              |Yes                                   |
| MessageTextStyle    | No                                    |Yes                              |Yes                                   |
| ProgressTextStyle   | No                                    |Yes                              |Yes                                   |
| ShowLogs            | Yes                                   |No                               |No                                    |

---

### Want to contribute? 
Pull requests and issues are always welcome!

#### How to contribute?
<ol>
  <li> Fork the <a href="https://github.com/fayaz07/progress_dialog">repository</a></li>
  <li> Clone it to your local machine </li>
  <li> Open the project in your favourite editor </li>  
  <li> Open cmd/terminal and run <b>flutter clean</b> and then <b>flutter packages get</b> </li>
  <li> Make the changes </li>
  <li> Create a <b>Pull Request</b> </li>
</ol>

#### View the issues [here](https://github.com/fayaz07/progress_dialog/issues)

#### This library is only tested for Android, iOS contributors are most welcome

---
Loading indicator -> https://loading.io/
