import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ForgetPassPhone extends StatefulWidget {
  const ForgetPassPhone({Key? key}) : super(key: key);

  @override
  _ForgetPassPhoneState createState() => _ForgetPassPhoneState();
}

class _ForgetPassPhoneState extends State<ForgetPassPhone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.keyboard_arrow_left),
        ),
        backgroundColor: Colors.red,
        title: Text("Quên mật khẩu"),
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Text("Chúng tôi vừa gửi một mã đến gmail của bạn ",style:TextStyle(fontSize: 17)),
              SizedBox(
                height: 7,
              ),
              Text("lytieulong@gmail.com",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  SizedBox(width: 9),
                  Container(
                    width: 75,
                    height: 75,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '1',
                          labelStyle: TextStyle(
                              fontStyle: FontStyle.normal, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 75,
                    height: 75,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '2',
                          labelStyle: TextStyle(
                              fontStyle: FontStyle.normal, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 75,
                    height: 75,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '3',
                          labelStyle: TextStyle(
                              fontStyle: FontStyle.normal, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 75,
                    height: 75,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: ' 4',
                          hintStyle: TextStyle(
                              fontStyle: FontStyle.normal, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 75,
                    height: 75,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          hintText: '5',
                          labelStyle: TextStyle(
                              fontStyle: FontStyle.normal, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  
                ],
              ),
              SizedBox(height:60),
               Container(
            height: 40,
            width: 200,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color:const Color(0xFFF05A22),
                    style: BorderStyle.solid,
                    width: 1.0,
                  ),
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Center(
                      child: Text(
                        "XÁC NHẬN",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ),
              ),
              SizedBox(height:50),
              Row(
              children: [
                SizedBox(width:155),
                ElevatedButton(
                  onPressed: () {},
                  child: Image.asset('images/icon/loading.jpg', width: 60),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                  ),
                ),
              ],
            ),
            ],
          ),
        ),
      ),
    );
  }
}
