import 'package:flutter/material.dart';
import 'package:bookshare/services/authentication_service/register.dart';

class Register2 extends StatefulWidget {
  @override
  _Register2State createState() => _Register2State();
}

class _Register2State extends State<Register2> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  Map data = {};
  String status;

  Future<void> updateData(String user,String e,String pass) async{
    RegisterAPI x = RegisterAPI();
    await x.signupUser(user, e, pass);
    status = x.status;
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    print(data);
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 15, 255, 26),
      body: SafeArea(
              child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromRGBO(250, 15, 255, 26),Color.fromRGBO(15, 146, 253, 51)],
              begin: Alignment.topRight,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Register',
                style: TextStyle(
                  fontFamily: 'Reem Kufi',
                  fontSize: 25,
                  color: Colors.white
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                      Icon(Icons.vpn_key,color:Colors.grey),
                      SizedBox(width:15),
                      Text(
                        'Password:',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'Reem Kufi'
                        ),
                      )
                ],
              ),
              SizedBox(height:20),
              Container(
                width: 350,
                padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                child: TextField(
                  obscureText: true,
                  controller: controller1,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    hintText: 'Enter your Password',
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(height:20),
              Row(
                children: <Widget>[
                      Icon(Icons.vpn_key,color:Colors.grey),
                      SizedBox(width:15),
                      Text(
                        'Confirm Password:',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'Reem Kufi'
                        ),
                      )
                ],
              ),
              SizedBox(height:20),
              Container(
                width: 350,
                padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                child: TextField(
                  controller: controller2,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    hintText: 'Confirm your Password',
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(height:30),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FlatButton(
                      padding: EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)
                      ),
                      onPressed: () async{
                        if(controller2.text.toString() == controller1.text.toString()){
                          await updateData(data['username'], data['email'], controller1.text.toString());
                          if(status == 'Registered User Successfully'){
                            return showDialog(context: context,builder: (context) {
                            return AlertDialog(
                              backgroundColor: Colors.lightBlueAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              title: Text(
                                'Registered Successfully',
                                style: TextStyle(
                                  color: Colors.blue
                                ),
                              ),
                              content: Text(
                                status,
                                style: TextStyle(
                                  color: Colors.blue
                                ),
                              ),
                              actions: <Widget>[
                                MaterialButton(onPressed: (){
                                  Navigator.popAndPushNamed(context, '/login');
                                },
                                child: Text(
                                  'Ok',
                                  style: TextStyle(
                                    color: Colors.blue
                                  ),
                                  ),
                                ),
                              ],
                            );
                          },);
                          }
                          else{
                            return showDialog(context: context,builder: (context) {
                            return AlertDialog(
                              backgroundColor: Colors.lightBlueAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              title: Text(
                                "Couldn't Register",
                                style: TextStyle(
                                  color: Colors.blue
                                ),
                              ),
                              content: Text(
                                status,
                                style: TextStyle(
                                  color: Colors.blue
                                ),
                              ),
                              actions: <Widget>[
                                MaterialButton(onPressed: (){
                                  Navigator.popAndPushNamed(context, '/login');
                                },
                                child: Text(
                                  'Ok',
                                  style: TextStyle(
                                    color: Colors.blue
                                  ),
                                  ),
                                ),
                              ],
                            );
                          },
                          );
                          }
                        }
                        else{
                            return showDialog(context: context,builder: (context) {
                            return AlertDialog(
                              backgroundColor: Colors.lightBlueAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              title: Text(
                                "Couldn't Register",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                              content: Text(
                                'Passwords are not matching',
                                style: TextStyle(
                                  color: Colors.blue,
                                )
                              ),
                              actions: <Widget>[
                                MaterialButton(onPressed: (){
                                  Navigator.popAndPushNamed(context, '/login');
                                },
                                child: Text(
                                  'Ok',
                                  style:TextStyle(
                                    color:Colors.blue
                                    )
                                  ),
                                )
                              ],
                            );
                          },
                          );
                        }
                      },  
                       child: Ink(
                         padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: <Widget>[
                           Text(
                             'Sign Up',
                             style: TextStyle(
                               color: Colors.white,
                             ),
                            ),
                         ],
                         ),
                         decoration: BoxDecoration(
                           color: Colors.blue[800],
                           borderRadius: BorderRadius.circular(20),
                         ),
                        ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Container(
                      height:50,
                      width: double.infinity,
                      padding: EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight:Radius.circular(35),
                        )
                      ),
                    ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}