## Complete Example
```
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
            
            if(!pr.isShowing())
                pr.show();
          Future.delayed(Duration(seconds: 3)).whenComplete((){
            if(pr.isShowing())
                pr.hide();
          });
        }),
      ),
    );
  }
}
```
## Demo
<img src="https://raw.githubusercontent.com/fayaz07/progress_dialog/master/progress.gif" width="350" height="620" alt="ProgressDialog Demo" />
