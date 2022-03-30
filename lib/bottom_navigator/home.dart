import 'package:badges/badges.dart';
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

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.acc}) : super(key: key);
  Account acc;
  @override
  _HomePageState createState() => _HomePageState(this.acc);
}

class _HomePageState extends State<HomePage> {
  final txtTimKiem = TextEditingController();
  _HomePageState(this.acc);
  Account acc;
  @override
  Widget build(BuildContext context) {
    Widget buildProduct(Future<List<Product>> fetchProduct) =>
        FutureBuilder<List<Product>>(
            future: fetchProduct,
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
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                              mainAxisExtent: 230),
                      itemCount: snap.data!.length,
                      itemBuilder: (context, index) {
                        return buildDetailProduct(
                            snap.data![index], context, acc);
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
              buildBanner(),
              const SizedBox(
                height: 5,
              ),
              Divider(
                color: Colors.grey.shade300,
                thickness: 5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Sản phẩm nổi bật',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              buildProduct(fetchFeaturedProduct()),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Sản phẩm mới',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              buildProduct(fetchNewProduct()),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildBanner() => CarouselSlider.builder(
    itemCount: imgBanners.length,
    itemBuilder: (context, index, realIndex) {
      final urlImage = imgBanners[index];
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage(urlImage), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(10)),
      );
    },
    options: CarouselOptions(height: 150, autoPlay: true));

final imgBanners = [
  'images/banner/banner.png',
  'images/banner/banner1.png',
  'images/banner/banner2.png'
];
