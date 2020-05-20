import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  final TextEditingController controller1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 15, 255, 26),
      body: SafeArea(
              child: Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
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
                      Image(image: NetworkImage("https://img.icons8.com/plasticine/100/000000/company.png"),height: 40,width: 40,),
                      SizedBox(width:15),
                      Text(
                        'User Name:',
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
                    hintText: 'Enter your User Name',
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
                        if(controller1.text.toString() == ''){
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
                                'User Field is empty',
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
                          Navigator.pushReplacementNamed(context, '/register1',arguments: {
                          'username' : controller1.text.toString()
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
              )
            ],
          ),
        ),
      ),
    );
  }
}