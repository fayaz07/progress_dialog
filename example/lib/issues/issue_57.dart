import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(context) {
    return MaterialApp(
      title: 'PDTest',
      initialRoute: '/home', 
      routes: {
        '/home': (context) {
          return HomePage();
        },
        '/profile': (conetxt) {
          return ProfilePage();
        },
      },
    );
  }
}

class HomePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ProgressDialog _pr = ProgressDialog(
      context,
      type: ProgressDialogType.Normal,
      isDismissible: false,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      drawer: drawerMenu(_pr, context),
      body: Center(
        child: Text('Home Page'),
      ),
    );
  }
}

Widget drawerMenu(ProgressDialog _pr, BuildContext context) {
  
  return Drawer(
    child: ListView(
      children: <Widget>[
        DrawerHeader(child: null),
        ListTile(
          title: Text('Profile Page'),
          onTap: () async {
            await _pr.show();
            Timer(Duration(seconds: 3), () async {
              if (_pr.isShowing()) await _pr.hide();
              Navigator.pushReplacementNamed(context, '/profile');
            });
          },
        ),
      ],
    ),
  );
}

class ProfilePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ProgressDialog _pr = ProgressDialog(
      context,
      type: ProgressDialogType.Normal,
      isDismissible: false,
    );
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.of(context).pushReplacementNamed('/home');
          },
        ),
        title: Text('Profile Page'),
      ),
      body: Center(
        child: Text('Profile Page'),
      ),
    );
  }
}