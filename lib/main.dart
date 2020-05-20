import 'package:flutter/material.dart';
import 'package:bookshare/Authentication/register.dart';
import 'package:bookshare/Authentication/login.dart';
import 'package:bookshare/Authentication/register1.dart';
import 'package:bookshare/loading.dart';
import 'package:bookshare/Authentication/register2.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown])
    .then((_) {
      runApp(MaterialApp(
    initialRoute: '/login',
    routes: {
      '/register': (context) => Register(),
      '/login' : (context) => Login(),
      '/register1' : (context) => Register1(),
      '/loading' : (context) => Loading(),
      '/register2' : (context) => Register2()
    },
  )
  );
    });
  
}