import 'package:cached_network_image/cached_network_image.dart';
import 'package:do_an/api/api_invoice.dart';
import 'package:do_an/api/api_product.dart';
import 'package:do_an/models/invoice_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

class ReviewTab extends StatefulWidget {
  ReviewTab({Key? key, required this.id}) : super(key: key);
  int id;
  @override
  _OrderDetailState createState() => _OrderDetailState(this.id);
}

class _OrderDetailState extends State<ReviewTab> {
  double rating = 0.0;
  final txtComent = TextEditingController();
  int id;
  _OrderDetailState(this.id);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Invoice>>(
          future: fetchInvoice(id, 3),
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
                                  "Chờ đánh giá",
                                  style: TextStyle(color: Colors.green),
                                ),
                                SizedBox(width: 150),
                                ElevatedButton(
                                    onPressed: () {
                                      showRating(
                                          id,
                                          snapshot.data![index]
                                              .detail![indexDetail].prd!.id,
                                          rating,
                                          txtComent,
                                          snapshot.data![index].id);
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.red),
                                    ),
                                    child: Text("Đánh giá")),
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

  void showRating(acc, prd, rating, TextEditingController comment, id) =>
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Bình luận và đánh giá"),
                content: Column(
                  children: [
                    RatingBar.builder(
                        minRating: 1,
                        itemSize: 30,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 10),
                        itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.red,
                            ),
                        updateOnDrag: true,
                        onRatingUpdate: (newRating) {
                          setState(() {
                            rating = newRating;
                          });
                        }),
                    TextField(
                      decoration: InputDecoration(hintText: 'Bình luận'),
                      controller: comment,
                    )
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () async {
                        bool ischeck =
                            await createRV(acc, prd, rating, comment.text, id);
                        if (ischeck) {
                          Navigator.pop(context);
                          (context as Element).reassemble();
                        }
                      },
                      child: Text("OK"))
                ],
              ));
}
