import 'package:cached_network_image/cached_network_image.dart';
import 'package:do_an/api/api_category.dart';
import 'package:do_an/pages/by_category.dart';
import 'package:do_an/pages/by_sub_category.dart';
import 'package:do_an/models/account_model.dart';
import 'package:do_an/models/category_model.dart';
import 'package:do_an/models/sub_category_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  CategoryScreen({Key? key, required this.acc}) : super(key: key);
  Account acc;
  @override
  _CategoryScreenState createState() => _CategoryScreenState(this.acc);
}

class _CategoryScreenState extends State<CategoryScreen> {
  int selectedIndex = 0;
  _CategoryScreenState(this.acc);
  final Account acc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(child: Text("Danh mục")),
        backgroundColor: Colors.redAccent,
      ),
      body: Row(mainAxisSize: MainAxisSize.min, children: [
        Container(
            width: 100,
            child: FutureBuilder<List<Category>>(
                future: fetchCategory(),
                builder: (context, snap) {
                  if (snap.hasError) {
                    return Center(child: Text(snap.hasError.toString()));
                  }
                  return snap.hasData
                      ? ListView.builder(
                          itemCount: snap.data!.length,
                          itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              onDoubleTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ByCategory(
                                              id: snap.data![index].id!,
                                              name: snap.data![index].name!,
                                              acc: acc,
                                            )));
                              },
                              child: Container(
                                height: 100,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: "http://10.0.2.2:8000/storage/" +
                                      snap.data![index].image!,
                                  placeholder: (context, url) => const Center(
                                    child: CupertinoActivityIndicator(),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Container(
                                    color: Colors.black12,
                                  ),
                                ),
                              )))
                      : const Center(
                          child: CircularProgressIndicator(),
                        );
                })),
        Container(
            width: 310,
            child: FutureBuilder<List<Category>>(
                future: fetchCategory(),
                builder: (context, snap) {
                  if (snap.hasError) {
                    return Center(child: Text(snap.hasError.toString()));
                  }
                  return snap.hasData
                      ? ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: snap.data!.length,
                          itemBuilder: (context, index) {
                            bool selected = selectedIndex == index;
                            if (selected) {
                              return buildSubCategory(snap.data![index].sub!);
                            }
                            return invisblesubCategory();
                          })
                      : const Center(
                          child: CircularProgressIndicator(),
                        );
                }))
      ]),
    );
  }

  Widget buildSubCategory(List<SubCategory> sub) {
    return Container(
      height: 250,
      alignment: Alignment.center,
      child: ListView.builder(
          itemCount: sub.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BySubCategory(
                              id: sub[index].id!,
                              name: sub[index].name!,
                              acc: acc,
                            )));
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Text(
                  sub[index].name!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(),
                ),
              ),
            );
          }),
    );
  }

  Widget invisblesubCategory() {
    return Container(
      height: 50,
    );
  }
}
