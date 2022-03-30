import 'package:do_an/models/account_model.dart';
import 'package:do_an/models/review_model.dart';
import 'package:do_an/tab/beingtransported.dart';
import 'package:do_an/tab/canceledgoods.dart';
import 'package:do_an/tab/delivered.dart';
import 'package:do_an/tab/returngoods.dart';
import 'package:do_an/tab/review.dart';
import 'package:do_an/tab/tabconfirming.dart';
import 'package:do_an/tab/waitingthegoods.dart';
import 'package:flutter/material.dart';

class Tabgoods extends StatefulWidget {
  Tabgoods({Key? key, required this.acc}) : super(key: key);
  Account acc;
  @override
  _TabgoodsState createState() => _TabgoodsState(this.acc);
}

class _TabgoodsState extends State<Tabgoods> {
  Account acc;
  _TabgoodsState(this.acc);
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Đơn mua"),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.red, Colors.red],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                ),
              ),
            ),
            bottom:TabBar(
              isScrollable: true,
              indicatorColor: Colors.white,
              indicatorWeight: 3,
              tabs: [
                Tab(text: 'Chờ xác nhận'),
                Tab(text: 'Đang giao'),
                Tab(text: 'Chờ đánh giá'),
                Tab(text: 'Đã giao'),
                Tab(text: 'Đã hủy'),
              ],
            ),
            elevation: 20,
            titleSpacing: 20,
          ),
          body: TabBarView(
            children: [
              TabConfirming(
                id: acc.id!,
              ),
              BeingTransported(
                id: acc.id!,
              ),
              ReviewTab(
                id: acc.id!,
              ),
              Delivered(id: acc.id!),
              Canceledgoods(id: acc.id!),
            ],
          ),
        ),
      );

  Widget buildPage(String text) => Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 28),
        ),
      );
}
