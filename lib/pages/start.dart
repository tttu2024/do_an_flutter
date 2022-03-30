
import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Image.asset('images/logo.png'),
          ),
          Container(
            height: 35,
            width: 200,
            child: GestureDetector(
              onTap: () {
              Navigator.restorablePopAndPushNamed(context, '/login');
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    style: BorderStyle.solid,
                    width: 1.0,
                  ),
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget> [
                    Center(
                      child:  Text (
                        "ĐĂNG NHẬP",
                        style:  TextStyle(
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 35,
            width: 200,
            child: GestureDetector(
              onTap: () {
               Navigator.restorablePopAndPushNamed(context, '/signup');
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color:const Color(0xFFF05A22),
                    style: BorderStyle.solid,
                    width: 1.0,
                  ),
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Center(
                      child: Text(
                        "ĐĂNG KÍ",
                        style: TextStyle(
                          color: Color(0xFFF05A22),
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
