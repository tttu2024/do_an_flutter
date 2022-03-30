import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DetailBills extends StatefulWidget {
  const DetailBills({Key? key}) : super(key: key);

  @override
  _OrderDetailState createState() => _OrderDetailState();
}

class _OrderDetailState extends State<DetailBills> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hủy đơn hàng"),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      "Đã hủy",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 15.0,
                    ),
                    Text("Đặt nhầm sản phẩm"),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ],
            ),
            Divider(
              color: Colors.grey.shade300,
              thickness: 5,
            ),
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Lý Tiểu Long - 0123456789",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "1280 ,ấp 10, xã Sơn Phú , huyện Giồng Trôm, tỉnh Bến Tre",
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ],
            ),
            Divider(
              color: Colors.grey.shade300,
              thickness: 5,
            ),
            Row(
              children: [
                SizedBox(width: 15),
                Text("Mã đơn hàng   "),
                Text(
                  "123456785",
                  style: TextStyle(fontWeight: FontWeight.w700),
                )
              ],
            ),
            Divider(
              color: Colors.grey.shade300,
              thickness: 5,
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                SizedBox(
                  width: 130,
                ),
                Icon(Icons.check_circle_outline),
               Text(
                      "Chi tiết thanh toán",
                      style: TextStyle(color: Colors.blue),
                    )
               
              ],
            ),
                       SizedBox(height:20),
           GestureDetector(
              child: Container(
                height: 40,
                width:150,
               
                color:Colors.pink,
                padding: EdgeInsets.all(10),
                child: Row(children: [
               
                  Text("Chat với shop",style: TextStyle(fontSize: 15),),
                    SizedBox(width:10),
                    Icon(Icons.chat),
                
                ],),
              ),
            ),
            SizedBox(height: 50),
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Column(
                  children: [
                    Text("Tổng thanh toán"),
                  ],
                ),
                SizedBox(
                  width: 110,
                ),
                Column(
                  children: [
                    Text(
                      "60.698.000 đ",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w800,
                          fontSize: 23),
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Column(
                  children: [
                    Text("Thanh toán bằng :"),
                  ],
                ),
                SizedBox(
                  width: 100,
                ),
                Column(
                  children: [
                    Text(
                      "Tiền mặt",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 40),
              Container(
            height: 40,
            width: 200,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
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
          ],
        ),
      ),
    );
  }
}
