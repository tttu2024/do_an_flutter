import 'package:cached_network_image/cached_network_image.dart';
import 'package:do_an/models/account_model.dart';
import 'package:do_an/models/cart_model.dart';
import 'package:do_an/models/product_model.dart';
import 'package:do_an/pages/cart.dart';
import 'package:do_an/pages/detail.dart';
import 'package:do_an/pages/favorite.dart';
import 'package:do_an/providers/cart_db.dart';
import 'package:do_an/providers/cart_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

DBHelper dbHelper = DBHelper();
Widget buildDetailProduct(Product prd, BuildContext context,Account acc) {
  return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetailsScreen(
                      product: prd,acc: acc,
                    )));
      },
      child: Stack(children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ]),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: CachedNetworkImage(
                  imageUrl: "http://10.0.2.2:8000/storage/" + prd.img![0].path!,
                  width: 140,
                  placeholder: (context, url) => const Center(
                    child: CupertinoActivityIndicator(),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: Colors.black12,
                  ),
                ),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    prd.name!,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      const Text(
                        'Giá:',
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        NumberFormat.currency(locale: 'vi').format(prd.price),
                        style: const TextStyle(color: Colors.red),
                      )
                    ],
                  ),
                ],
              ))
            ],
          ),
        ),
        Positioned(
            top: 7,
            right: 10,
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Favorite(prd: prd, acc: acc)));
              },
              child: const Icon(
                Icons.favorite_border,
              ),
            )),
      ]));
}
