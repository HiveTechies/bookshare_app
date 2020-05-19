import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Map data = {};
  Future<void> getData() async{
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
  }
  Future<void> update() async{
    await getData();
    Navigator.pushReplacementNamed(context, '/register1',arguments: data);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    update();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Center(
            child: AnimatedOpacity(
        opacity: 0.51,
        duration: Duration(milliseconds: 10),
              child: Container(
            decoration: BoxDecoration(
              gradient:LinearGradient(
                      colors: [Color(0xabFA21FF),Color(0xFF2192FD)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomRight,
                  ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SpinKitCircle(
                  color: Colors.blueGrey,
                  size: 35,
                ),
                SizedBox(height:20),
                Text(
                  'Loading',
                  style:TextStyle(
                    color: Colors.blue[300],
                  ),
                ),
              ],
            )
        ),
      ),
          ),
    );
  }
}