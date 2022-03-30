import 'package:cached_network_image/cached_network_image.dart';
import 'package:do_an/models/account_model.dart';
import 'package:do_an/pages/start.dart';
import 'package:do_an/pages/user/infomationuser.dart';
import 'package:do_an/pages/user/tabgoods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailUser extends StatefulWidget {
  const DetailUser({Key? key, required this.acc}) : super(key: key);
  final Account acc;
  @override
  _DetailUserState createState() => _DetailUserState(this.acc);
}

class _DetailUserState extends State<DetailUser> {
  final Account acc;
  _DetailUserState(this.acc);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chi tiết người dùng"),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                SizedBox(width: 30),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InfomationUser(
                                  acc: acc,
                                )));
                  },
                  child: Container(
                    height: 45,
                    width: 250,
                    decoration: BoxDecoration(),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Text(
                          acc.fullName.toString(),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(width: 20),
                        Icon(Icons.keyboard_arrow_right)
                      ],
                    ),
                  ),
                ),
                CachedNetworkImage(
                  width: 50,
                  imageUrl: "http://10.0.2.2:8000/storage/" + acc.avatar!,
                  placeholder: (context, url) => const Center(
                    child: CupertinoActivityIndicator(),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: Colors.black12,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Divider(
              color: Colors.grey.shade300,
              thickness: 6,
            ),
            Container(
              child: Row(
                children: [
                  SizedBox(width: 20),
                  Image.asset('images/icon/like_ib.png', width: 30),
                  SizedBox(width: 20),
                  Text("Chi tiết đơn hàng"),
                  SizedBox(width: 130),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Tabgoods(
                                      acc: acc,
                                    )));
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios,
                      )),
                ],
              ),
            ),
            Divider(
              color: Colors.grey.shade300,
              thickness: 6,
            ),
            Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Text(
                  "Quan tâm",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 25),
                      Column(children: <Widget>[
                        GestureDetector(
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: Colors.green.shade100,
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 8,
                                ),
                                Icon(Icons.favorite_border),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text("Yêu thích"),
                      ]),
                      SizedBox(width: 25),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: Colors.grey.shade300,
              thickness: 10,
            ),
            
            Container(
              height: 35,
              width: 200,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => StartScreen()),
                      (route) => false);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Center(
                        child: Text(
                          "ĐĂNG  XUẤT",
                          style: TextStyle(
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
          ],
        ),
      ),
    );
  }
}
