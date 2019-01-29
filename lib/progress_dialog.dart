library progress_dialog;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ProgressDialog {

  BuildContext buildContext;
  String message = "Loading...";

  ProgressDialog(this.buildContext);

  void setMessage(String mess){
    this.message = mess;
  }

  void show() {
    _showDialog();
  }

  void hide() {
    Navigator.pop(buildContext);
  }

  Future _showDialog() {
    showDialog(
      context: buildContext,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        return CupertinoAlertDialog(
          content: SizedBox(
            height: 45.0,
            child: Center(
              child: Row(
                children: <Widget>[
                  SizedBox(width: 10.0),
                  CircularProgressIndicator(),
                  SizedBox(width: 20.0),
                  Text(
                    message,
                    style: TextStyle(color: Colors.black, fontSize: 20.0),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
/*
class MessageBox{
  BuildContext buildContext;
  String message,title;

  MessageBox(this.buildContext,this.title,this.message){
    _showDialog();
  }

  Future _showDialog() {
    showDialog(
      context: buildContext,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        return CupertinoAlertDialog(
          title: Text(title,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),
          content: Padding(padding: const EdgeInsets.all(5.0),child: Text(message,textAlign: TextAlign.center,),),
          actions: <Widget>[
            FlatButton(child: Text('Ok'),onPressed: (){
              Navigator.pop(context);
            },)
          ],
        );
      },
    );
  }
}*/