import 'package:cached_network_image/cached_network_image.dart';
import 'package:do_an/api/api_invoice.dart';
import 'package:do_an/api/api_shipping.dart';
import 'package:do_an/bottom_navigator/bottom.dart';
import 'package:do_an/models/account_model.dart';
import 'package:do_an/models/cart_model.dart';
import 'package:do_an/models/shipping_model.dart';
import 'package:do_an/providers/cart_db.dart';
import 'package:do_an/providers/cart_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatefulWidget {
  CheckoutScreen({Key? key, required this.acc}) : super(key: key);
  final Account acc;
  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState(this.acc);
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  DBHelper db = DBHelper();
  final Account acc;
  _CheckoutScreenState(this.acc);
  Shipping? dropdownvalue;
  int priceSp = 0;
  final name = TextEditingController();
  final phone = TextEditingController();
  final address = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Đặt hàng'),
          backgroundColor: Colors.red,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Image.asset(
                  'images/gps.png',
                  width: 50,
                ),
                const SizedBox(
                  width: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Địa chỉ nhận hàng'),
                    const SizedBox(
                      height: 5,
                    ),
                    Text('Họ tên: ' + acc.fullName!),
                    Text('SĐT: ' + acc.phone!),
                    Text('Địa chỉ: ' + acc.address!)
                  ],
                )
              ],
            ),
            Divider(
              color: Colors.grey.shade300,
              thickness: 5,
            ),
            buildProduct(cart),
            const SizedBox(
              height: 10,
            ),
             Divider(
              color: Colors.grey.shade300,
              thickness: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.monetization_on),
                const Text('Phương thức thanh toán'),
                Container(
                    width: 200, child: const Text('Thanh toán khi nhận hàng'))
              ],
            ),
            Divider(
              color: Colors.grey.shade300,
              thickness: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              
                Row(
                  
                  children: [
                    Text('Tổng tiền'),
                    Text(
                      NumberFormat.currency(locale: 'vi')
                          .format(priceSp + cart.getTotal()),
                      style: const TextStyle(color: Colors.red),
                    ),
                  ],
                )
              ],
            ),
            Divider(
              color: Colors.grey.shade300,
              thickness: 5,
            ),
            Center(
              child: InkWell(
                onTap: () async {
                  bool isCheck = await isCreate(acc.id!, acc.address!, context);
                  if (isCheck) {
                    cart.resetTotal();
                    db.deleteAllCart().then((value) {
                      ScaffoldMessenger.of(context)
                        ..removeCurrentSnackBar()
                        ..showSnackBar(const SnackBar(
                          content: Text('Đặt hàng thành công'),
                          duration: Duration(seconds: 5),
                        ));
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Bottom(acc: acc)),
                          (route) => false);
                    }).onError((error, stackTrace) {
                      print(error.toString());
                    });
                  }
                },
                child: Container(
                  child: const Align(
                    child: Text(
                      "Đặt hàng",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                  ),
                  width: 300,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
             const SizedBox(
              height: 10,
            ),
           
          ],
        ));
  }

  Widget buildProduct(CartProvider cart) => Container(
        child: FutureBuilder<List<Cart>>(
          future: cart.getData(),
          builder: (context, snap) {
            return snap.hasData
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: snap.data!.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ]),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: CachedNetworkImage(
                                imageUrl: "http://10.0.2.2:8000/storage/" +
                                    snap.data![index].image!,
                                width: 100,
                                placeholder: (context, url) => const Center(
                                  child: CupertinoActivityIndicator(),
                                ),
                                errorWidget: (context, url, error) => Container(
                                  color: Colors.black12,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      snap.data![index].productName!,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const Text('Giá:'),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              NumberFormat.currency(
                                                      locale: 'vi')
                                                  .format(snap
                                                      .data![index].totalPrice),
                                              style: const TextStyle(
                                                  color: Colors.red),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          'SL:' +
                                              snap.data![index].quantity
                                                  .toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w300),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      );
}
