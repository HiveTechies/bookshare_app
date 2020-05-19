import 'package:http/http.dart';
import 'dart:convert';
class RegisterAPI{
  String username;
  String email;
  String password;
  String status;
  Map data = {};

  Future<void> signupUser(String user,String e,String pass) async{
    username = user;
    email = e;
    password = pass;
    data = {
      'username' : username,
      'email' : email,
      'password' : password
    };
    Response response = await post('https://mandalorian.pythonanywhere.com/auth/users/',body: data);
    Map data2 = jsonDecode(response.body);
    if(data2.containsKey('detail') ){
      status = 'Cannot register User';
    }
    else if(data2.containsKey('username')){
      status = 'User Already Exists';
    }
    else if(data2.containsKey('password')){
      status = data2['password'].join('\n');
    }
    else{
      status = 'Registered User Successfully';
    }
  }
}