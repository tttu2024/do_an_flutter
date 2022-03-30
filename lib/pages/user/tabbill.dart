import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TabBill extends StatefulWidget {
  const TabBill({Key? key}) : super(key: key);

  @override
  _OrderDetailState createState() => _OrderDetailState();
}

class _OrderDetailState extends State<TabBill> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hủy đơn hàng"),
        backgroundColor: Colors.red,
        bottom: TabBar(
          tabs: [
            Tab(text: 'Tab 1 ',icon: Icon(Icons.home)),
             Tab(text: 'Tab 1 ',icon: Icon(Icons.star)),
              Tab(text: 'Tab 1 ',icon: Icon(Icons.person)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [

          
          ],
        ),
      ),
    );
  }
}
