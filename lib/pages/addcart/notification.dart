import 'package:flutter/material.dart';
class NotificationCart extends StatefulWidget {
  const NotificationCart({ Key? key }) : super(key: key);

  @override
  _NotificationCartState createState() => _NotificationCartState();
}

class _NotificationCartState extends State<NotificationCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 70, left: 20, right: 20 ),
          child: Column( crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                Icon(Icons.check_circle,color: Colors.green),
                Text(' Đã thêm thành công vào giỏ hàng',style: TextStyle(fontSize: 18),)
              ],
              ),
              SizedBox(height: 20,),
            Row(children: [
              Image.asset('images/details/macbookgold.png',width: 170,),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Row(
                  children: [
                    Text('Giá: '),
                    Text('23.200.000 vnđ',style: TextStyle(color: Colors.red),),
                  ],
                ),
                SizedBox(height: 10),
                Text('Kho: 12345'),
                
              ],)
            ],),
            SizedBox(height: 20),
              Text('MVFM2 – MacBook Air 2019 New (Gold/Corei5/R am 8GB/SSD 128GB/Touch ID'),
            SizedBox(height: 20),
              Text('Màu sắc:'),
            SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Image.asset('images/details/macbookgold.png', width: 100,),
                      SizedBox(height: 10),
                      Text('Gold Color'),
                    ],
                  ),
                  SizedBox(width: 30),
                  Column(
                    children: [
                      Image.asset('images/details/macbookgray.png', width: 60,),
                      SizedBox(height: 10),
                      Text('Gray Color'),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30),
              Center(child: ElevatedButton(style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red),), onPressed: (){
              Navigator.pushNamed(context,'/orderdetail');
            }, child: Text('Chi tiết giỏ hàng')))
          ],),
        ),
      ),
    );
  }
}