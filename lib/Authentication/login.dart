import 'package:flutter/material.dart';
import 'package:bookshare/services/authentication_service/login.dart';
class Login extends StatelessWidget {
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
      body: SingleChildScrollView(
              child: Stack(
          children:<Widget>[ 
            Container(
          width : MediaQuery. of(context). size. width,
          height: MediaQuery. of(context). size. height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xabFA21FF),Color(0xFF2192FD)],
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
            ),
          ),
          child:Column(
            children: <Widget>[
                SizedBox(height: 100,),
                Text(
                  'Login',
                  style: TextStyle(
                    fontFamily: 'Reem Kulfi',
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  width: 300,
                  child: TextField(
                    controller: controller1,
                    decoration:  InputDecoration(
                      prefixIcon:Icon(
                        Icons.mail,
                        color: Colors.black,
                      ),
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(80.0),
                        ),
                      ),
                      hintText: 'Enter the email address',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 300,
                  child: TextField(
                    controller: controller2,
                    obscureText: true,
                    decoration:  InputDecoration(
                      prefixIcon: Icon(Icons.lock,color: Colors.grey[900],),
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(80.0),
                        ),
                      ),
                      hintText: 'Enter the Password',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 20),
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
                SizedBox(height: 30),
                InkWell(
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onTap: () => Navigator.pushNamed(context, '/forgotpassword'),
                ),
                SizedBox(height:40),
                Container(
                    height: 330,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.lightBlue[100],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight:Radius.circular(35),
                      )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 40),
                        Center(
                          child: Text(
                            'or connect with',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFF484848),
                            ),
                          ),
                        ),
                        SizedBox(height:50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(width:15),
                            Center(
                              child: FlatButton(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80)),
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Ink(
                                  padding: EdgeInsets.fromLTRB(15, 10, 20, 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(80),
                                    color: Colors.blue[400],
                                    
                                  ),
                                  child: Row(
                                          children: <Widget>[
                                      Image(image: NetworkImage('https://img.icons8.com/officel/2x/facebook-new.png'),height: 30,width: 28,),
                                      SizedBox(width:8),
                                      Text(
                                        'Facebook Login',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                onPressed: (){},    //TODO: Facebook Login Connection
                              ),
                            ),
                            SizedBox(width:30),
                            FlatButton(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80)),
                              padding: EdgeInsets.fromLTRB( 0, 0, 0, 0),
                              child: Ink(
                                padding: EdgeInsets.fromLTRB(15, 10, 20, 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(80),
                                  color: Colors.blue[800],
                                ),
                                child: Row(
                                        children: <Widget>[
                                    Image(image: NetworkImage('https://cdn2.iconfinder.com/data/icons/minimalism/512/twitter.png'),height: 30,width: 28,),
                                    SizedBox(width:8),
                                    Text(
                                      'Twitter Login',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onPressed: (){},  //TODO: Twitter Login Connection
                            )
                          ],
                        ),
                        SizedBox(height:60),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:<Widget>[
                            Text(
                              "Don't have an account?",
                              style: TextStyle(
                                fontFamily: 'Reem Kufi',
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(width:5),
                            InkWell(
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontWeight:FontWeight.bold,
                                  fontFamily: 'Reem Kufi',
                                  fontSize: 15
                                  )
                              ),
                              onTap: () => Navigator.pushNamed(context, '/register'),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                
            ],
          ),
        ),
        ],
              ),
      ),
    );
  }
}