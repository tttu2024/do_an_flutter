import 'package:cached_network_image/cached_network_image.dart';
import 'package:do_an/models/account_model.dart';
import 'package:do_an/models/cart_model.dart';
import 'package:do_an/models/product_model.dart';
import 'package:do_an/pages/cart.dart';
import 'package:do_an/providers/cart_db.dart';
import 'package:do_an/providers/cart_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddCartScreen extends StatelessWidget {
  AddCartScreen({Key? key, required this.prd, required this.acc}) : super(key: key);
  Account acc;
  Product prd;
  DBHelper db = DBHelper();
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 70, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        "http://10.0.2.2:8000/storage/" + prd.img![0].path!,
                    width: 140,
                    placeholder: (context, url) => const Center(
                      child: CupertinoActivityIndicator(),
                    ),
                    errorWidget: (context, url, error) => Container(
                      color: Colors.black12,
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('Giá: '),
                          Text(
                            NumberFormat.currency(locale: 'vi')
                                .format(prd.price),
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text('Kho: ' + prd.quantity.toString()),
                    ],
                  )
                ],
              ),
              SizedBox(height: 20),
              Text(prd.name!),
              SizedBox(height: 20),
              Center(
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                      ),
                      onPressed: () async {
                        bool check = await db.isItem(prd.id!) == 1;
                        if (check) {
                          db.updateItem(prd.id!).then((value) {
                            ScaffoldMessenger.of(context)
                              ..removeCurrentSnackBar()
                              ..showSnackBar(SnackBar(
                                  content: const Text('Đã thêm vào giỏ hàng'),
                                  duration: const Duration(seconds: 5),
                                  action: SnackBarAction(
                                      label: 'Xem giỏ hàng',
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CartPage(acc: acc,)));
                                      })));
                            cart.addTotal(prd.price!);
                          }).onError((error, stackTrace) {
                            print(error.toString());
                          });
                        } else {
                          db
                              .insert(Cart(
                                  productId: prd.id,
                                  productName: prd.name,
                                  unitPrice: prd.price,
                                  quantity: 1,
                                  totalPrice: prd.price,
                                  image: prd.img![0].path))
                              .then((value) {
                            ScaffoldMessenger.of(context)
                              ..removeCurrentSnackBar()
                              ..showSnackBar(SnackBar(
                                  content: const Text('Đã thêm vào giỏ hàng'),
                                  duration: const Duration(seconds: 5),
                                  action: SnackBarAction(
                                      label: 'Xem giỏ hàng',
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CartPage(acc: acc,)));
                                      })));
                            cart.addTotal(prd.price!);
                          }).onError((error, stackTrace) {
                            print(error.toString());
                          });
                        }
                      },
                      child: Text('Thêm vào giỏ hàng')))
            ],
          ),
        ),
      ),
    );
  }
}
