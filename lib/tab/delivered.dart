import 'package:cached_network_image/cached_network_image.dart';
import 'package:do_an/api/api_invoice.dart';
import 'package:do_an/api/api_product.dart';
import 'package:do_an/models/invoice_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

class Delivered extends StatefulWidget {
  Delivered({Key? key, required this.id}) : super(key: key);
  int id;
  @override
  _OrderDetailState createState() => _OrderDetailState(this.id);
}

class _OrderDetailState extends State<Delivered> {
  int id;
  _OrderDetailState(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Invoice>>(
          future: fetchInvoice(id,4),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) => ListView.builder(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data![index].detail!.length,
                        itemBuilder: (context, indexDetail) => Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl:
                                          "http://10.0.2.2:8000/storage/" +
                                              snapshot
                                                  .data![index]
                                                  .detail![indexDetail]
                                                  .prd!
                                                  .img![0]
                                                  .path!,
                                      width: 100,
                                      placeholder: (context, url) =>
                                          const Center(
                                        child: CupertinoActivityIndicator(),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Container(
                                        color: Colors.black12,
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Text(
                                    snapshot.data![index].detail![indexDetail]
                                        .prd!.name!,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 220,
                                ),
                                Text("Giá"),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  NumberFormat.currency(locale: 'vi').format(
                                      snapshot.data![index].detail![indexDetail]
                                          .price),
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                            Divider(
                              color: Colors.grey.shade200,
                              thickness: 2,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Icon(Icons.pending),
                                SizedBox(width: 5),
                                Text(
                                  "Đã giao",
                                  style: TextStyle(color: Colors.green),
                                ),
                              ],
                            ),
                            Divider(
                              color: Colors.grey.shade300,
                              thickness: 6,
                            ),
                          ],
                        ),
                      ));
            }
            return Column(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 150,
                        ),
                        Image.asset(
                          'images/product/5.jpg',
                          width: 100,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 150,
                        ),
                        Text("Chưa có đơn hàng"),
                      ],
                    ),
                  ],
                )
              ],
            );
          }),
    );
  }

  
}
