import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

//import '../../lib/progress_dialog.dart';

ProgressDialog pr;

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  double percentage = 0.0;

  @override
  Widget build(BuildContext context) {
//    pr = new ProgressDialog(context,
//        type: ProgressDialogType.Normal, isDismissible: false);
//    pr = new ProgressDialog(context, type: ProgressDialogType.Download);

// Custom body test
    pr = ProgressDialog(
      context,
      type: ProgressDialogType.Download,
      textDirection: TextDirection.rtl,
      isDismissible: true,
//      customBody: LinearProgressIndicator(
//        valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
//        backgroundColor: Colors.white,
//      ),
    );

    pr.style(
//      message: 'Downloading file...',
      message:
          'Lets dump some huge text into the progress dialog and check whether it can handle the huge text. If it works then not you or me, flutter is awesome',
      borderRadius: 10.0,
      backgroundColor: Colors.white,
      elevation: 10.0,
      insetAnimCurve: Curves.easeInOut,
      progress: 0.0,
      progressWidgetAlignment: Alignment.center,
      maxProgress: 100.0,
      progressTextStyle: TextStyle(
          color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
      messageTextStyle: TextStyle(
          color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600),
    );

    return Scaffold(
      body: Center(
        child: RaisedButton(
            child: Text(
              'Show Dialog',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
            onPressed: () async {
              await pr.show();

              Future.delayed(Duration(seconds: 2)).then((onvalue) {
                percentage = percentage + 30.0;
                print(percentage);

                pr.update(
                  progress: percentage,
                  message: "Please wait...",
                  progressWidget: Container(
                      padding: EdgeInsets.all(8.0),
                      child: CircularProgressIndicator()),
                  maxProgress: 100.0,
                  progressTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 13.0,
                      fontWeight: FontWeight.w400),
                  messageTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 19.0,
                      fontWeight: FontWeight.w600),
                );

                Future.delayed(Duration(seconds: 2)).then((value) {
                  percentage = percentage + 30.0;
                  pr.update(
                      progress: percentage, message: "Few more seconds...");
                  print(percentage);
                  Future.delayed(Duration(seconds: 2)).then((value) {
                    percentage = percentage + 30.0;
                    pr.update(progress: percentage, message: "Almost done...");
                    print(percentage);

                    Future.delayed(Duration(seconds: 2)).then((value) {
                      pr.hide().whenComplete(() {
                        print(pr.isShowing());
                      });
                      percentage = 0.0;
                    });
                  });
                });
              });

              Future.delayed(Duration(seconds: 10)).then((onValue) {
                print("PR status  ${pr.isShowing()}");
                if (pr.isShowing())
                  pr.hide().then((isHidden) {
                    print(isHidden);
                  });
                print("PR status  ${pr.isShowing()}");
              });
            }),
      ),
    );
  }
}

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  ProgressDialog pr;

  @override
  Widget build(BuildContext context) {
    pr = new ProgressDialog(context, showLogs: true);
    pr.style(message: 'Please wait...');

    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text('Show dialog and go to next screen',
              style: TextStyle(color: Colors.white)),
          color: Colors.blueAccent,
          onPressed: () {
            pr.show();
            Future.delayed(Duration(seconds: 3)).then((value) {
              pr.hide().whenComplete(() {
                Navigator.of(context).push(CupertinoPageRoute(
                    builder: (BuildContext context) => SecondScreen()));
              });
            });
          },
        ),
      ),
    );
  }
}

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('I am second screen')),
    );
  }
}
