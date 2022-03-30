import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Returngoods extends StatefulWidget {
  const Returngoods({Key? key}) : super(key: key);

  @override
  _OrderDetailState createState() => _OrderDetailState();
}

class _OrderDetailState extends State<Returngoods> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(height: 100,),
                
                Row(
                  children: [
                     SizedBox(width:150,),
                        Image.asset('images/product/5.jpg',width: 100,),
                  ],
                ),
                SizedBox(height: 10,),
                  Row(
                    children: [
                              SizedBox(width:150,),
                      Text("Chưa có đơn hàng"),
                    ],
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
