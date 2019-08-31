import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

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
//    pr = new ProgressDialog(context,type: ProgressDialogType.Normal);
    pr = new ProgressDialog(context, type: ProgressDialogType.Download);

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
              Future.delayed(Duration(seconds: 2)).then((onvalue) {
                percentage = percentage + 30.0;
                print(percentage);

                pr.update(
                  progress: percentage,
                  message: "Please wait...",
                  progressWidget: Container(
                      padding: EdgeInsets.all(8.0), child: CircularProgressIndicator()),
                  maxProgress: 100.0,
                  progressTextStyle: TextStyle(
                      color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
                  messageTextStyle: TextStyle(
                      color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600),
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
                      pr.hide();
                      percentage = 0.0;
                    });
                  });
                });
              });
              /*
              Future.delayed(Duration(seconds: 10)).then((onValue){
                print("PR status  ${pr.isShowing()}" );
                if(pr.isShowing())
                  pr.hide();
                print("PR status  ${pr.isShowing()}" );
              });*/
            }),
      ),
    );
  }
}
