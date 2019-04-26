## Complete Example for Normal Progress Dialog

```dart
import 'package:progress_dialog/progress_dialog.dart';
import 'package:flutter/material.dart';

ProgressDialog pr;

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  var percentage = 0.0;

  @override
  Widget build(BuildContext context) {
    pr = new ProgressDialog(context,ProgressDialogType.Download);
    pr.setMessage('Downloading file...');
    return Scaffold(
      body: Center(
        child: RaisedButton(
            child: Text(
              'Show Dialog',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
            onPressed: () {
              pr.show();
              Future.delayed(Duration(seconds: 5)).then((Value){
                pr.hide();
              });

            }),
      ),
    );
  }
}
```

## Complete Example for Download Progress Dialog

```dart
import 'package:progress_dialog/progress_dialog.dart';
import 'package:flutter/material.dart';

ProgressDialog pr;

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  var percentage = 0.0;

  @override
  Widget build(BuildContext context) {
    pr = new ProgressDialog(context,ProgressDialogType.Download);
    pr.setMessage('Downloading file...');
    return Scaffold(
      body: Center(
        child: RaisedButton(
            child: Text(
              'Show Dialog',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
            onPressed: () {
              pr.show();
              Future.delayed(Duration(seconds:2)).then((onvalue){
                percentage = percentage+30.0;
                print(percentage);
                pr.update(progress: percentage,message: "Please wait...");
                Future.delayed(Duration(seconds: 2)).then((value){
                  percentage = percentage+30.0;
                  pr.update(progress: percentage,message: "Few more seconds...");
                  print(percentage);
                  Future.delayed(Duration(seconds: 2)).then((value){
                    percentage = percentage+30.0;
                    pr.update(progress: percentage,message: "Almost done...");
                    print(percentage);

                    Future.delayed(Duration(seconds: 2)).then((value){
                      pr.hide();
                      percentage = 0.0;

                    });
                  });
                });
              });

            }),
      ),
    );
  }
}
```
## Demo
| Normal        | Download      |
| ------------- |:-------------:|
|<img src="https://raw.githubusercontent.com/fayaz07/progress_dialog/master/progress.gif" width="200" height="460" alt="ProgressDialog Demo" />       | <img src="https://raw.githubusercontent.com/fayaz07/progress_dialog/master/progress.gif" width="200" height="460" alt="ProgressDialog Demo" /> |




