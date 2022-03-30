import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:do_an/models/account_model.dart';
import 'package:do_an/models/product_model.dart';
import 'package:do_an/pages/addcart/add_cart_screen.dart';
import 'package:do_an/pages/review.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({Key? key, required this.product,required this.acc}) : super(key: key);
  Account acc;
  Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(hintText: product.name),
        ),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        children: [
          CarouselSlider.builder(
              itemCount: product.img!.length,
              itemBuilder: (context, index, realIndex) => CachedNetworkImage(
                    imageUrl: "http://10.0.2.2:8000/storage/" +
                        product.img![index].path.toString(),
                    //width: 200,
                    placeholder: (context, url) => const Center(
                      child: CupertinoActivityIndicator(),
                    ),
                    errorWidget: (context, url, error) => Container(
                      color: Colors.white,
                    ),
                  ),
              options: CarouselOptions(autoPlay: true)),

          const SizedBox(height: 20),
          Text(product.name!),
          const SizedBox(height: 20),
          // Row(
          //   children: const [
          //     Text('Lượt đánh giá: '),
          //     Icon(
          //       Icons.star_outline,
          //     ),
          //     Icon(
          //       Icons.star_outline,
          //     ),
          //     Icon(
          //       Icons.star_outline,
          //     ),
          //     Icon(
          //       Icons.star_outline,
          //     ),
          //     Icon(
          //       Icons.star_outline,
          //     ),
          //     SizedBox(
          //       width: 30,
          //     ),
          //     Icon(
          //       Icons.favorite_border_outlined,
          //     ),
          //     SizedBox(
          //       width: 10,
          //     ),
          //     Icon(
          //       Icons.share,
          //     ),
          //   ],
          // ),
          // Row(
          //   children: const [
          //     Icon(
          //       Icons.shopping_cart,
          //       color: Colors.grey,
          //       size: 20,
          //     ),
          //     SizedBox(
          //       width: 10,
          //     ),
          //     Text('104 Lượt mua'),
          //     SizedBox(
          //       width: 100,
          //     ),
          Text(
            'Số lượng còn lại: ' + product.quantity.toString(),
            style: const TextStyle(color: Colors.red),
          ),
          // ],
          // ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 10,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 10,
          ),
          // Row(
          //   children: [
          //     const Text('15 Mã Giảm Giá'),
          //     const SizedBox(
          //       width: 10,
          //     ),
          //     Container(
          //       child: const Center(child: Text('Giảm 49k')),
          //       height: 20,
          //       color: Colors.yellow,
          //     ),
          //     const SizedBox(
          //       width: 10,
          //     ),
          //     Container(
          //       child: const Center(child: Text('Giảm 109k')),
          //       height: 20,
          //       color: Colors.yellow,
          //     ),
          //     const SizedBox(
          //       width: 15,
          //     ),
          //     const Icon(
          //       Icons.arrow_forward_ios,
          //       color: Colors.grey,
          //       size: 20,
          //     ),
          //     const SizedBox(
          //       height: 10,
          //     ),
          //   ],
          // ),
          // const SizedBox(
          //   height: 10,
          // ),
          // Row(
          //   children: [
          //     const Text('1 quà tặng kèm'),
          //     const SizedBox(
          //       width: 13,
          //     ),
          //     Image.asset(
          //       'images/details/balo.png',
          //       width: 50,
          //     ),
          //     const SizedBox(
          //       width: 15,
          //     ),
          //     const Icon(
          //       Icons.arrow_forward_ios,
          //       color: Colors.grey,
          //       size: 20,
          //     ),
          //   ],
          // ),
          // Container(
          //   height: 10,
          //   color: Colors.grey,
          // ),
          // SizedBox(
          //   height: 10,
          // ),
          // Container(
          //   height: 10,
          //   color: Colors.grey,
          // ),
          // SizedBox(
          //   height: 10,
          // ),
          // const SizedBox(
          //   height: 10,
          // ),
          // Container(
          //   height: 5,
          //   color: Colors.grey,
          // ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Flexible(
                child: Column(
                  children: const [
                    Icon(
                      Icons.sync,
                      color: Colors.grey,
                      size: 30,
                    ),
                    Text('Hoàn tiền 111% nếu hàng giả!!!'),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: Column(
                  children: const [
                    Icon(
                      Icons.thumb_up_alt,
                      color: Colors.grey,
                      size: 30,
                    ),
                    Text('Thông tin bảo hành'),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: Column(
                  children: const [
                    Icon(
                      Icons.sync,
                      color: Colors.grey,
                      size: 30,
                    ),
                    Text('Đổi trả trong 7 ngày nếu sản phẩm lỗi'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Center(
              child: Text(
            'XEM CHI TIẾT',
            style: TextStyle(color: Colors.blue),
          )),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 10,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Cấu hình',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text('CPU: '),
              SizedBox(
                width: 35,
              ),
              Expanded(
                child: Text(
                  product.cpu!,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text('RAM: '),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: Text(
                  product.ram!,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text('Ổ cứng: '),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Text(
                  product.storage!,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text('VGA: '),
              const SizedBox(
                width: 35,
              ),
              Expanded(
                child: Text(
                  product.vga!,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text('Màn hình:'),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  product.screen!,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text('Pin: '),
              const SizedBox(
                width: 45,
              ),
              Text(
                product.battery!,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text('OS: '),
              const SizedBox(
                width: 45,
              ),
              Text(
                product.operatingSystem!,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 10,
          ),
          // Center(
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: const [
          //       Text(
          //         'Xem tất cả',
          //         style: TextStyle(color: Colors.blue),
          //       ),
          //       Icon(
          //         Icons.arrow_forward_ios,
          //         color: Colors.grey,
          //         size: 20,
          //       ),
          //     ],
          //   ),
          // ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 10,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Mô tả sản phẩm',
            style: TextStyle(fontSize: 30, color: Colors.red),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(product.description!),
          // Column(
          //   children: const [
          //     Text(
          //       'Bổ sung tính năng True Tone, màn hình Retina sắc nét',
          //       style: TextStyle(fontSize: 20, color: Colors.black),
          //     ),
          //     SizedBox(
          //       height: 10,
          //     ),
          //     Text(
          //       'Với màn hình Retina, độ phân giải 2560 x 1600 cho hơn 4 triệu điểm ảnh MacBook Air 2019 i5 mang đến chất lượng hình ảnh chi tiết và chân thực hơn bao giờ hết.',
          //       style: TextStyle(fontSize: 15, color: Colors.black),
          //     ),
          //     SizedBox(
          //       height: 10,
          //     ),
          //     Text(
          //       'Siêu mỏng, siêu nhẹ',
          //       style: TextStyle(fontSize: 20, color: Colors.black),
          //     ),
          //     SizedBox(
          //       height: 10,
          //     ),
          //     Text(
          //       'MacBook Air 2019 giữ nguyên thiết kế với thế hệ 2018. Máy được làm từ vỏ nhôm nguyên khối, pin liền với độ dày 15.6 mm và khối lượng 1.25 kg. Đặc biệt hơn, chiếc Macbook này được làm từ nhôm tái chế có độ bền cao và có thể bảo vệ môi trường.',
          //       style: TextStyle(fontSize: 15, color: Colors.black),
          //     ),
          //     SizedBox(
          //       height: 10,
          //     ),
          //     Text(
          //       'Cấu hình khỏe, xử lý văn phòng, Photoshop mượt mà',
          //       style: TextStyle(fontSize: 20, color: Colors.black),
          //     ),
          //     SizedBox(
          //       height: 10,
          //     ),
          //     Text(
          //       'Laptop Apple MacBook Air 2019 được trang bị bộ xử lý Intel Core i5 và bộ nhớ 8 GB, card đồ họa tích hợp Intel UHD Graphics 617 cho phép bạn hoạt động trơn tru ngay cả khi mở nhiều ứng dụng hoạt động cùng lúc và thoải mái trong việc duyệt web, chơi game, sử dụng mượt mà các thao tác từ phần mềm Office cho đến Photoshop, AI… Laptop Apple MacBook Air 2019',
          //       style: TextStyle(fontSize: 15, color: Colors.black),
          //     ),
          //   ],
          // ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ReviewScreen(prdId: product.id!,)));
                },
                child: Column(
                  children: const [
                    Icon(
                      Icons.question_answer,
                      color: Colors.grey,
                      size: 50,
                    ),
                    Text('Đánh giá')
                  ],
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddCartScreen(prd: product,acc: acc,)));
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.add_shopping_cart,
                      color: Colors.grey,
                      size: 50,
                    ),
                    Text('Add Cart')
                  ],
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              
            ],
          )
        ],
      ),
    );
  }
}
