import 'package:http/http.dart';
import 'dart:convert';

class LoginAPI {
  String username;
  String email;
  String status;
  Future<void> getLoginCredentials(String user,String password) async{
    try{
      Map data = {};
      Map data1 = {};
      Map data2 = {};
      data = {
        'username' : user,
        'password' : password
      };
      Response response = await post('https://mandalorian.pythonanywhere.com/auth/token/login/',body:data);
      data1 = json.decode(response.body);
      if(data1.containsKey('auth_token')){
        Response response2 = await get('https://mandalorian.pythonanywhere.com/auth/users/me/',headers: {'Authorization': 'Token '+data1['auth_token'].toString()});
        data2 = jsonDecode(response2.body);
        if(data2.containsKey('detail')){
          status = 'Authentication Error';
        }
        else{
          username = data2['username'];
          email = data2['email'];
          status = '200'; 
        }
      }
      else{
        status = 'Username or password is incorrect';
      }
      
    } 
    catch(e){
      username = 'null';
      email= 'null';
      status = 'Internet Error';
    }           
}
}