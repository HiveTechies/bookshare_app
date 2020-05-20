import 'package:bookshare/services/authentication_service/login.dart';
import 'package:flutter/material.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  String username;
  String email;
  String status;
  SnackBar snackbar;

  Future<void> update() async{
    LoginAPI x = LoginAPI();
    await x.getLoginCredentials(controller1.text.toString(), controller2.text.toString());
    username = x.username;
    email = x.email;
    status = x.status;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SingleChildScrollView(
              child: Ink(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 100),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors:  [Color(0xabFA21FF),Color(0xFF2192FD)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 100,),
                        Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize:25
                          ),
                        ),
                        SizedBox(height:30),
                        Ink(
                          width: 300,
                          child: TextField(
                            controller: controller1,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.black26),
                              hintText: "Enter the Username",
                              hintStyle: TextStyle(
                                color: Colors.grey
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35),
                              )
                            ),
                          ),
                        ),
                        SizedBox(height: 25,),
                        Ink(
                          width: 300,
                          child: TextField(
                            controller: controller2,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.vpn_key,
                                color: Colors.black26),
                              hintText: "Enter the Password",
                              filled: true,
                              fillColor: Colors.white,
                              hintStyle: TextStyle(
                                color: Colors.grey
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35),
                              )
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        FlatButton(
                        shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(80)),
                        padding: EdgeInsets.all(0),
                        onPressed: ()async{
                          if(controller1.text.toString() != '' && controller2.text.toString() != ''){
                            await update();
                          if(status=='Internet Error' || status == 'Authentication Error' || status == '404' || status == null || status == 'Username or password is incorrect'){
                            
                            return showDialog(context: context,builder: (context){
                              return AlertDialog(
                                backgroundColor: Colors.lightBlue[100],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                title: Text(
                                  "Couldn't Login",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.blueAccent,
                                  ),
                                ),
                                content: Text(
                                  status,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.blue,
                                  ),
                                ),
                                actions: <Widget>[
                                  MaterialButton(
                                    onPressed: (){
                                      Navigator.popAndPushNamed(context, '/login');
                                    },
                                    child: Text(
                                      "Ok",
                                      style: TextStyle(
                                        color: Colors.blue
                                      ),
                                  ),
                                )
                                ],
                              );
                            } 
                            ,);
                          }
                          else{
                            Map data = {};
                            data = {
                              'username' : username,
                              'email' : email
                            };
                            Navigator.pushReplacementNamed(context, '/register1',arguments: data);
                          }
                          }
                          else{
                            showDialog(context: context,builder:(context){
                              AlertDialog(
                                title: Text(
                                  "Fields cannot be empty",
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                                backgroundColor: Colors.lightBlueAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                content: Text(
                                  "One or both of the username and password fields are empty",
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                  ),
                                actions: <Widget>[
                                  MaterialButton(onPressed: (){
                                    Navigator.popAndPushNamed(context, '/login');
                                  },
                                  child: Text(
                                    "Ok",
                                    style: TextStyle(
                                      color: Colors.blue,
                                    )
                                  ),
                                  )
                                ],
                              );
                            } );
                          }
                        },
                        child: Ink(
                          padding: EdgeInsets.fromLTRB(100, 15, 100, 15),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white
                            ),
                          ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF1E3C72),Color(0xFF2A5298)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(80))
                        ),),
                      ),
                      MaterialButton(
                        onPressed: (){},
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Colors.white,
                          )
                        ),
                      ),
                      SizedBox(height:30),
                      Ink(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height*(3/8),
                        
                      )
                      ],
                    ),
                  ),
      ),
      );
  }
}