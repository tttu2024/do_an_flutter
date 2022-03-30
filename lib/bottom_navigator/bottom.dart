import 'package:do_an/bottom_navigator/category.dart';
import 'package:do_an/bottom_navigator/home.dart';
import 'package:do_an/models/account_model.dart';
import 'package:do_an/pages/user/detailuser.dart';
import 'package:flutter/material.dart';

class Bottom extends StatefulWidget {
  Bottom({Key? key, required this.acc}) : super(key: key);
  final Account acc;
  @override
  _BottomState createState() => _BottomState(this.acc);
}

class _BottomState extends State<Bottom> {
  final Account acc;
  _BottomState(this.acc);
  int currentInex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomePage(
        acc: acc,
      ),
      CategoryScreen(
        acc: acc,
      ),
      DetailUser(
        acc: acc,
      ),
    ];
    return Scaffold(
      body: pages[currentInex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentInex,
        iconSize: 30,
        selectedItemColor: Colors.black,
        onTap: (index) => setState(() => currentInex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.house), label: 'Trang chủ'),
          BottomNavigationBarItem(
            icon: Icon(Icons.border_all),
            label: 'Danh mục',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Người dùng')
        ],
      ),
    );
  }
}
