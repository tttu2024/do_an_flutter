import 'package:badges/badges.dart';
import 'package:do_an/pages/cart.dart';
import 'package:do_an/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget buildHeader(txtTimKiem, context, acc) => Column(
      children: [
        Container(
          width: 100,
          height: 100,
          child: Align(
            alignment: Alignment.center,
            child: Image.asset(
              'images/logo.png',
            ),
          ),
        ),
        Container(
          width: 350,
          height: 40,
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                      prefix: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      label: Text('Bạn tìm gì?')),
                  controller: txtTimKiem,
                ),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CartPage(acc: acc)));
                  },
                  icon: const Icon(Icons.shopping_cart)),
            ],
          ),
        ),
      ],
    );
