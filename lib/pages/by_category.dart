import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:do_an/api/api_product.dart';
import 'package:do_an/models/account_model.dart';
import 'package:do_an/models/product_model.dart';
import 'package:do_an/providers/cart_provider.dart';
import 'package:do_an/widget/widget_header.dart';
import 'package:do_an/widget/widget_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ByCategory extends StatelessWidget {
  ByCategory({Key? key, required this.id, required this.name, required this.acc})
      : super(key: key);
  int id;
  String name;
  Account acc;
  final txtTimKiem = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    Widget buildProductByCategory(cart) => FutureBuilder<List<Product>>(
        future: fetchProductByCategory(id),
        builder: (context, snap) {
          if (snap.hasError) {
            return Center(
              child: Text(snap.hasError.toString()),
            );
          }
          return snap.hasData
              ? GridView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      mainAxisExtent: 230),
                  itemCount: snap.data!.length,
                  itemBuilder: (context, index) {
                    return buildDetailProduct(snap.data![index], context, acc);
                  })
              : const Center(
                  child: CircularProgressIndicator(),
                );
        });

    return GestureDetector(
      //huy keyboard khi bam ngoai man hinh
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              buildHeader(txtTimKiem, context, acc),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 5,
              ),
              Divider(
                color: Colors.grey.shade300,
                thickness: 5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              buildProductByCategory(cart),
            ],
          ),
        ),
      ),
    );
  }
}
