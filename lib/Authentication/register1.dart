import 'package:flutter/material.dart';
class Register1 extends StatefulWidget {
  @override
  _Register1State createState() => _Register1State();
}

class _Register1State extends State<Register1> {
  TextEditingController controller1 = TextEditingController();

  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
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
                      Icon(Icons.mail,color: Colors.grey,),
                      SizedBox(width:15),
                      Text(
                        'Email:',
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
                  controller: controller1,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    hintText: 'Enter your email address',
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
                        String email = controller1.text.toString();
                        bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
                        if(email == ''){
                          showDialog(context: context,builder: (context) {
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
                                "Email Field shouldn't be empty",
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
                        else if(emailValid == false){
                          showDialog(context: context,builder: (context) {
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
                                "The given email address is not in\n the form of Email address\n please correct it",
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
                        Navigator.pushReplacementNamed(context, '/register2',arguments: {
                          'username' : data['username'],
                          'email' : controller1.text.toString(),
                        });
                        }
                      },  
                       child: Ink(
                         padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: <Widget>[
                           Text(
                             'Next',
                             style: TextStyle(
                               color: Colors.white,
                             ),
                            ),
                            SizedBox(width:5),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            )
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