import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class OrderDetail extends StatefulWidget {
  const OrderDetail({Key? key}) : super(key: key);

  @override
  _OrderDetailState createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hủy đơn hàng"),
        backgroundColor: Colors.red,
    //      leading: IconButton(
    // onPressed: () {},
    // icon: Icon(Icons.keyboard_arrow_left),)
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(children: [
             SizedBox(width: 200,),
              Text("11/11/2021"),
               SizedBox(width: 50,),
                Text("11:02"),
            ],),
                Row(
                  children: [
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      "Chờ xác nhận",
                      style: TextStyle(fontWeight: FontWeight.w700,fontSize: 17),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                
              ],
            ),
            Row(
              children: [
                SizedBox(width: 16,),
                Text("Chờ xác nhận chậm nhất trong 48h"),
              ],
            ),
            Divider(
              color: Colors.grey.shade300,
              thickness: 5,
            ),
            Row(
                  children: [
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      "Giao tiêu chuẩn",
                      style: TextStyle(fontWeight: FontWeight.w700,fontSize: 17),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                
              ],
            ),
            Row(
              children: [
                SizedBox(width: 16,),
                Text("Dự kiến thứ 2 , 15/11"),
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
                      style: TextStyle(fontSize: 20),
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
                Text("Mã đơn hàng   :"),
                SizedBox(width: 10,),
                Text(
                  "123456785",
                  style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18),
                ),
                SizedBox(width: 80,),
                 Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Sao chép",
                      style:TextStyle(color: Colors.blue)
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
            SizedBox(
              height: 30,
            ),
         
        
            SizedBox(height: 50),
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Column(
                  children: [
                    Text("Tổng thanh toán :", style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),
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
                   Text("Thanh toán băng :", style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),
                  ],
                ),
                SizedBox(
                  width: 100,
                ),
                Column(
                  children: [
                    SizedBox(width: 150,),
                    Text(
                      "Tiền mặt",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
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
                Navigator.pushNamed(context, '/resondistroy');
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                   
                    style: BorderStyle.solid,
                    width: 1.0,
                  ),
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Center(
                      child: Text(
                        "HỦY ĐƠN HÀNG",
                        style: TextStyle(
                          color: Colors.black,
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
