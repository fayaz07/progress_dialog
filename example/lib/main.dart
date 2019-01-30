import 'package:progress_dialog/progress_dialog.dart';
import 'package:flutter/material.dart';

ProgressDialog pr;

void main(){
  runApp(
      MaterialApp(
        home: MyApp(),
      )
  );
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    pr = new ProgressDialog(context);
    pr.setMessage('Please wait...');
    return Scaffold(
      body: Center(
        child: RaisedButton(
            child: Text('Show Dialog',style: TextStyle(color: Colors.white),),
            color: Colors.blue,
            onPressed: (){
              pr.show();
              Future.delayed(Duration(seconds: 3)).whenComplete((){
                pr.hide();
              });
            }),
      ),
    );
  }
}