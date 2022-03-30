import 'package:cached_network_image/cached_network_image.dart';
import 'package:do_an/models/account_model.dart';
import 'package:do_an/models/cart_model.dart';
import 'package:do_an/pages/checkout.dart';
import 'package:do_an/providers/cart_db.dart';
import 'package:do_an/providers/cart_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  CartPage({Key? key, required this.acc}) : super(key: key);
  final Account acc;
  @override
  _CartPageState createState() => _CartPageState(this.acc);
}

class _CartPageState extends State<CartPage> {
  _CartPageState(this.acc);
  final Account acc;
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    DBHelper dbHelper = DBHelper();
    return Scaffold(
        appBar: AppBar(
          title: const Align(child: Text('Giỏ hàng')),
          backgroundColor: Colors.red,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
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
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: const Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ]),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  "http://10.0.2.2:8000/storage/" +
                                                      snap.data![index].image!,
                                              width: 100,
                                              placeholder: (context, url) =>
                                                  const Center(
                                                child:
                                                    CupertinoActivityIndicator(),
                                              ),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Container(
                                                color: Colors.black12,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.all(15),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Text(
                                                    snap.data![index]
                                                        .productName!,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
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
                                                                .data![index]
                                                                .totalPrice),
                                                        style: const TextStyle(
                                                            color: Colors.red),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        //padding: EdgeInsets.only(top: 10),
                                                        width: 80,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            InkWell(
                                                              onTap: () {
                                                                int quantity = snap
                                                                    .data![
                                                                        index]
                                                                    .quantity!;
                                                                int price = snap
                                                                    .data![
                                                                        index]
                                                                    .unitPrice!;
                                                                quantity--;
                                                                int? newPrice =
                                                                    price *
                                                                        quantity;
                                                                if (quantity >
                                                                    0) {
                                                                  dbHelper
                                                                      .updateQuantity(Cart(
                                                                          id: snap
                                                                              .data![
                                                                                  index]
                                                                              .id,
                                                                          productId: snap
                                                                              .data![
                                                                                  index]
                                                                              .productId,
                                                                          productName: snap
                                                                              .data![
                                                                                  index]
                                                                              .productName,
                                                                          image: snap
                                                                              .data![
                                                                                  index]
                                                                              .image,
                                                                          unitPrice: snap
                                                                              .data![
                                                                                  index]
                                                                              .unitPrice,
                                                                          quantity:
                                                                              quantity,
                                                                          totalPrice:
                                                                              newPrice))
                                                                      .then(
                                                                          (value) {
                                                                    newPrice =
                                                                        0;
                                                                    quantity =
                                                                        0;
                                                                    cart.removeTotal(snap
                                                                        .data![
                                                                            index]
                                                                        .unitPrice!);
                                                                  }).onError((error,
                                                                          StackTrace) {
                                                                    print(error
                                                                        .toString());
                                                                  });
                                                                }
                                                              },
                                                              child: const Icon(
                                                                Icons.remove,
                                                              ),
                                                            ),
                                                            Text(snap
                                                                .data![index]
                                                                .quantity
                                                                .toString()),
                                                            InkWell(
                                                              onTap: () {
                                                                int quantity = snap
                                                                    .data![
                                                                        index]
                                                                    .quantity!;
                                                                int price = snap
                                                                    .data![
                                                                        index]
                                                                    .unitPrice!;
                                                                quantity++;
                                                                int? newPrice =
                                                                    price *
                                                                        quantity;
                                                                dbHelper
                                                                    .updateQuantity(Cart(
                                                                        id: snap
                                                                            .data![
                                                                                index]
                                                                            .id,
                                                                        productId: snap
                                                                            .data![
                                                                                index]
                                                                            .productId,
                                                                        productName: snap
                                                                            .data![
                                                                                index]
                                                                            .productName,
                                                                        image: snap
                                                                            .data![
                                                                                index]
                                                                            .image,
                                                                        unitPrice: snap
                                                                            .data![
                                                                                index]
                                                                            .unitPrice,
                                                                        quantity:
                                                                            quantity,
                                                                        totalPrice:
                                                                            newPrice))
                                                                    .then(
                                                                        (value) {
                                                                  newPrice = 0;
                                                                  quantity = 0;
                                                                  cart.addTotal(snap
                                                                      .data![
                                                                          index]
                                                                      .unitPrice!);
                                                                }).onError((error,
                                                                        StackTrace) {
                                                                  print(error
                                                                      .toString());
                                                                });
                                                              },
                                                              child: const Icon(
                                                                Icons.add,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 100),
                                                        child: InkWell(
                                                          onTap: () {
                                                            dbHelper.delete(snap
                                                                .data![index]
                                                                .id!);
                                                            cart.removeTotal(snap
                                                                .data![index]
                                                                .totalPrice!);
                                                          },
                                                          child: const Icon(
                                                            Icons.delete,
                                                            color: Colors.red,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ))
                          : const Center(
                              child: CircularProgressIndicator(),
                            );
                    })),
            Divider(
              color: Colors.grey.shade300,
              thickness: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const Text(
                    'Tổng tiền: ',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    NumberFormat.currency(locale: 'vi').format(cart.getTotal()),
                    style: const TextStyle(color: Colors.red, fontSize: 20),
                  )
                ],
              ),
            ),
            Center(
              child: InkWell(
                onTap: () async {
                  final lstCart = await cart.getData();
                  if (lstCart.isEmpty) {
                    showDialog(
                        context: context,
                        builder: (context) => const AlertDialog(
                              title: Text('Thông báo'),
                              content: Text('Vui lòng chọn sản phẩm >.<'),
                            ));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CheckoutScreen(acc: acc,)));
                  }
                },
                child: Container(
                  child: const Align(
                    child: Text(
                      "Mua hàng",
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
            )
          ],
        ));
  }
}
