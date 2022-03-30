import 'package:do_an/api/api_account.dart';
import 'package:do_an/api/api_product.dart';
import 'package:do_an/models/account_model.dart';
import 'package:do_an/models/review_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewScreen extends StatelessWidget {
  ReviewScreen({Key? key, required this.prdId}) : super(key: key);
  final int prdId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Bình luận và đánh giá'),
      ),
      body: FutureBuilder<List<Review>>(
          future: fetchReview(prdId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    int id = snapshot.data![index].accountId!;
                    return Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      margin: const EdgeInsets.symmetric(vertical: 1),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.person),
                              FutureBuilder<Account?>(
                                  future: information(id),
                                  builder: (context, snap) {
                                    if (snap.hasData) {
                                      return Text(snap.data!.fullName!);
                                    } else {
                                      return Text('');
                                    }
                                  })
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                RatingBarIndicator(
                                    rating: double.parse(
                                        snapshot.data![index].vote!.toString()),
                                    itemSize: 20.0,
                                    itemBuilder: (context, index) {
                                      return const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      );
                                    })
                              ],
                            ),
                          ),
                          Text(snapshot.data![index].comments!),
                        ],
                      ),
                    );
                  },
                ),
              );
            } else {
              return Container();
            }
          }),
    );
  }
}
