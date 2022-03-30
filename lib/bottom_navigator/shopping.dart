import 'package:do_an/brand/macbook.dart';
import 'package:do_an/pages/detail.dart';
import 'package:flutter/material.dart';

class ShoppingPage extends StatefulWidget {
  ShoppingPage({Key? key}) : super(key: key);

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  final txtTimKiem = TextEditingController();
  final imgBanners = [
    'images/banner/banner.png',
    'images/banner/banner1.png',
    'images/banner/banner2.png'
  ];

  final imgProducts = [
    'images/product/1.jpg',
    'images/product/2.jpg',
    'images/product/3.jpg',
    'images/product/4.jpg'
  ];
  final nameProduct = [
    'MSI Katana Gaming GF66 11UC i7 11800H',
    'Asus ROG Zephyrus G14 Alan Walker R9 5900HS ',
    'Acer Nitro 5 Gaming AN515 57 727J i7 11800H',
    'Lenovo Yoga Slim 7 14ITL05 i5 1135G7 '
  ];
  @override
  Widget build(BuildContext context) {
    Widget timKiem = Align(
      child: Container(
        width: 350,
        height: 40,
        child: Row(children: [
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                label: Text('Bạn tìm gì hôm nay?'),
              ),
              controller: txtTimKiem,
            ),
          ),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.shopping_cart_outlined))
        ]),
      ),
    );

    //button brand
    Widget brand = Column(
      children: [
        Row(children: [
          buildImgButton(context, 'images/brand/macbook.png', MacBook()),
          buildImgButton(context, 'images/brand/asus.png', MacBook()),
          buildImgButton(context, 'images/brand/hp.png', MacBook()),
          buildImgButton(context, 'images/brand/lenovo.png', MacBook()),
        ]),
        Row(
          children: [
            buildImgButton(context, 'images/brand/acer.png', MacBook()),
            buildImgButton(context, 'images/brand/dell.png', MacBook()),
            buildImgButton(context, 'images/brand/msi.png', MacBook()),
            buildImgButton(context, 'images/brand/lg.png', MacBook()),
          ],
        )
      ],
    );
    // build produc
    Widget buildProduct({VoidCallback? onClicked}) => Container(
          height: 350,
          child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 20.0),
              itemCount: imgProducts.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    children: [
                      InkWell(
                        child: Image(
                          image: AssetImage(imgProducts[index]),
                          width: 100,
                          height: 100,
                        ),
                        onTap: onClicked,
                      ),
                      Text(nameProduct[index]),
                    ],
                  ),
                );
              }),
        );
    return Scaffold(
      appBar: AppBar(
        title: const Align(
            child: Text(
          'Mua hàng',
        )),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: timKiem,
          ),
          const SizedBox(
            height: 20,
          ),
          const Align(
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Loại sản phẩm',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            alignment: Alignment.centerLeft,
          ),
          Divider(
            color: Colors.grey.shade300,
            thickness: 5,
          ),
          brand,
          Divider(
            color: Colors.grey.shade300,
            thickness: 5,
          ),
          const Padding(
              padding: EdgeInsets.only(left: 5.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Sản phẩm bán chạy',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
          buildProduct(
              onClicked: () => Navigator.pushNamed(
                  context, '/details')),
          Divider(
            color: Colors.grey.shade300,
            thickness: 5,
          ),
          const Padding(
              padding: EdgeInsets.only(left: 5.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Top sale',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
          buildProduct(),
        ],
      ),
    );
  }
}

Widget buildImgButton(BuildContext context, String urlImg, Widget route) {
  return Material(
    child: InkWell(
      child: Container(
          width: 100,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Image.asset(
            urlImg,
            width: 100,
            height: 50,
          )),
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => route)),
    ),
  );
}
