import 'package:do_an/bottom_navigator/home.dart';
import 'package:do_an/models/account_model.dart';
import 'package:do_an/models/product_model.dart';
import 'package:do_an/widget/widget_product.dart';
import 'package:flutter/material.dart';
class Favorite extends StatelessWidget {
 Favorite({ Key? key,required this.prd ,required this.acc}) : super(key: key);
  Product prd;
  Account acc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
      centerTitle: true,
      leading: Navigator.canPop(context)
          ? IconButton(
              icon: Icon(Icons.navigate_before_outlined,
                  color: Colors.white, size: 30),
              onPressed: () => Navigator.of(context).pop(),
            )
          : null,
      title: Text(
        "Yêu thích",
        style: TextStyle(fontSize: 22 , color: Colors.white),
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.red,
    ),
      body: SingleChildScrollView(
          child: GridView.builder(
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
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return buildDetailProduct(prd,context,acc);
                  })
      ),
    );
    
  }
}