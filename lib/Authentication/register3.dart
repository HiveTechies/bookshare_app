import 'package:flutter/material.dart';

class FinalSignup extends StatefulWidget {
  @override
  _FinalSignupState createState() => _FinalSignupState();
}

class _FinalSignupState extends State<FinalSignup> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();

  Map data = {};

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
              Container(
                width: 350,
                padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                child: TextField(
                  controller: controller1,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_circle,color:Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    hintText: 'Username',
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(height:20),
              Container(
                width: 350,
                padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                child: TextField(
                  controller: controller2,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.alternate_email,color:Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(height:20),
              Container(
                width: 350,
                padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                child: TextField(
                  obscureText: true,
                  controller: controller3,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.vpn_key,color:Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(height:20),
              Container(
                width: 350,
                padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                child: TextField(
                  controller: controller4,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.vpn_key,color:Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    hintText: 'Confirm Password',
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(height:20),
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
                      onPressed: (){
                        print(controller1.text.toString());
                        if(controller3.text.toString() == controller4.text.toString()){
                          Navigator.pushReplacementNamed(context, '/registercomplete',arguments: {
                          'name' : data['fname'],
                          'lname' : data['lname'],
                          'phone' : data['phone'],
                          'username' : controller1.text.toString(),
                          'email' : controller2.text.toString(),
                          'password' : controller3.text.toString()
                        });
                        }
                        else{
                          showDialog(context: context,builder: (context) {
                            return AlertDialog(
                              backgroundColor: Colors.lightBlue,
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
                                  Navigator.popAndPushNamed(context, '/register');
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
                         child: Text(
                           'Submit',
                           style: TextStyle(
                             color: Colors.white
                           ),
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